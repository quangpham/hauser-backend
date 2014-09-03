class House < ActiveRecord::Base
  
  has_many :users, :through => :user_house_rs
  has_many :user_house_rs, :dependent => :destroy

  has_many :facilities, :through => :house_facility_rs
  has_many :house_facility_rs, :dependent => :destroy

  has_many :pins, :dependent => :destroy

  def add_user(user)
  	begin
  		self.users.push(user)
  	rescue
  		return false
  	end
  	return true
  end

  def remove_user(user)
  	begin
  		self.users.delete(user)
  	rescue
  		return false
  	end
  	return true
  end

end