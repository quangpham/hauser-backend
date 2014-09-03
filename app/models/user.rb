class User < ActiveRecord::Base
	include Security

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable , :rememberable, :trackable
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  has_many :posts

  has_many :auths, :dependent => :destroy

  has_many :houses, :through => :user_house_rs
  has_many :user_house_rs, dependent: :destroy

  has_many :facilities, :through => :user_facility_bookings
  has_many :user_facility_bookings, :dependent => :destroy

  has_many :pins, :dependent => :destroy

  def self.from_phone_number(phone_number)
  	where(:phone_number => phone_number).first_or_create do |u|
  		u.phone_number = phone_number
      u.email = phone_number + "@fake.me"
      # Generate confirmation code for the first time
      u.confirmation_code = rand(100000..999999)
    end
  end

  def password_required?
  	super && (confirmation_code.blank?)
 	end

end