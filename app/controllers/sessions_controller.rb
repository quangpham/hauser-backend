class SessionsController < Devise::SessionsController
  #include ActionController::MimeResponds
  
  skip_before_filter :authenticate_user_from_token!, :only => [:login_request, :login]
  skip_after_filter  :verify_authorized

  def my_houses
    render json: current_user.houses
  end

  def basic_info
    render json: current_user
  end

  def houses_info
    houses_info = []
    
    current_user.user_house_rs.each do |h|
      house = {}
      house["address"] = House.find_by_id(h.house_id).address
      house["id"] = h.house_id
      house["room_number"] = h.room_number
      house["name_plate"] = h.name_plate
      house["is_received_post_office_notification"] = h.is_received_post_office_notification
      house["is_received_nearby_ads"] = h.is_received_nearby_ads
      house["is_living_now"] = h.is_living_now
      houses_info.push(house)
    end

    render json: houses_info
  end

  def update_house_info
    user_house_info = UserHouseR.find_by_house_id_and_user_id(params[:id], current_user.id)
    user_house_info.room_number = params[:room_number]
    user_house_info.name_plate = params[:name_plate]
    user_house_info.is_living_now = params[:is_living_now]
    
    # TODO
    if params[:is_living_now]
      user_house_info.is_received_nearby_ads = params[:is_received_nearby_ads]
      user_house_info.is_received_post_office_notification = params[:is_received_post_office_notification]
    else
      user_house_info.is_received_nearby_ads = false
      user_house_info.is_received_post_office_notification = false
    end
    
    render json: user_house_info if user_house_info.save
  end

  def update_basic_user_info
    current_user.full_name = params[:full_name]
    current_user.phone_number = params[:phone_number]
    current_user.avatar_url = params[:avatar_url]
    current_user.email = params[:email]

    render json: current_user if current_user.save
  end

  def update_user_info
    update_status = {}

    current_user.full_name = params[:basicInfo][:full_name]
    current_user.phone_number = params[:basicInfo][:phone_number]
    current_user.avatar_url = params[:basicInfo][:avatar_url]
    current_user.email = params[:basicInfo][:email]

    if current_user.save
      update_status[:basic_info] = "okie"
    else
      update_status[:basic_info] = "fail"
    end

    if params[:houseInfos]
      params[:houseInfos].each do |info|
        user_house_info = UserHouseR.find_by_house_id_and_user_id(info[:id], current_user.id)
        user_house_info.room_number = info[:room_number]
        user_house_info.name_plate = info[:name_plate]
        user_house_info.save
      end
    end

    render json: update_status
    
  end

  def login_request
    user = User.from_phone_number(params[:user][:phone_number])
    render :json => {:status => "code_sent"} if user.send_confirmation_code_by_sms
  end

  def login
    user = User.from_phone_number(params[:user][:phone_number])
    if user.code_match?(params[:user][:confirmation_code])
      handle_success(user)
    else
      handle_failure(user)
    end
  end

  def destroy
    current_user.logout(params[:token])
    render :json => {:success => true, :message => "logged_out"}
  end

  private
  def handle_success(resource)
    resource.generate_authentication_token
    
    if resource.houses.all.count > 0
      user_first_house_id = resource.houses.first.id
    else
      user_first_house_id = -1
    end

    render :json => {:status => "code_matched", :token => resource.auths.last.token, :secret => resource.auths.last.secret, :userid => resource.id, :user_first_house_id => user_first_house_id}
  end

  def handle_failure(resource)
    msg = {status: "wrong_code"}
    render json: msg, :status => :unauthorized
  end

end
