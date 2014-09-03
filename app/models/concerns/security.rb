module Security
  extend ActiveSupport::Concern
  
  def code_match?(confirmation_code)
    self.confirmation_code == confirmation_code
  end
  
  def send_confirmation_code_by_sms
    msg = {:to => self.phone_number, :from => 'Housing', :text => 'Your code is: ' + self.confirmation_code.to_s}
    response = Nexmo::Client.new('656b9b13','569aa25f').send_message(msg)
    response
    # true
  end
  
  def generate_authentication_token
    self.auths.create(token: ensure_auth_token, secret: Devise.friendly_token)
    self.update(confirmation_code: rand(100000..999999))
  end

  def logout(token)
    auth = self.auths.find_by_token(token)
    auth.delete if auth
  end
 
  private

  def ensure_auth_token
    loop do
      token = Devise.friendly_token
      break token unless Auth.where(token: token).first
    end
  end

end