class UserHouseR < ActiveRecord::Base
	validates :user_id, :uniqueness => {:scope => :house_id}
	belongs_to :house
	belongs_to :user
end