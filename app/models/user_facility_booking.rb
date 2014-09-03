class UserFacilityBooking < ActiveRecord::Base
	# validates :user_id, :uniqueness => {:scope => :facility_id}
	belongs_to :facility
	belongs_to :user

	after_create :sync_with_firebase

	def self.create_booking(params)
		# if params[:booking_date] is yesterday
		# if params[:booking_slot] is not in the rule
		# if current reachs limit of bookings per week
		
		return {status: "booking_created_error", msg: "missing_booking_date"} unless params[:booking_date]
		return {status: "booking_created_error", msg: "missing_booking_slot"} unless params[:booking_slot]
		return {status: "booking_created_error", msg: "booking_existed"} if find_by_facility_id_and_booking_date_and_booking_slot(params[:facility_id], params[:booking_date], params[:booking_slot])

		facility = Facility.find_by_id(params[:facility_id])

		return {status: "booking_created", msg: "okie"} if create(facility_id: params[:facility_id], booking_date: params[:booking_date], booking_slot: params[:booking_slot], user_id: params[:user_id], facility_name: facility.name, facility_thumbnail: facility.thumbnail)
		
	end

private
	def sync_with_firebase
		# DATA to send like this data = ["free","free","quang","john","free","free","free"]

		house_id = Facility.find_by_id(self.facility_id).house.id
		house_info = UserHouseR.find_by_user_id_and_house_id(self.user_id, house_id)
		
		if house_info.room_number
			from = house_info.room_number + " " + house_info.name_plate.to_s
		else
			from = self.user_id
		end

		firebase = Firebase.new('https://housing.firebaseio.com/')
		path = "facilities/" + self.facility_id.to_s + "/bookings/" + self.booking_date.to_s + "/" + self.booking_slot.to_s + "/"
		response = firebase.set(path, {user: from})
	end
end