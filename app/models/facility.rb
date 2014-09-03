class Facility < ActiveRecord::Base
  
  has_one :house, :through => :house_facility_r
  has_one :house_facility_r, :dependent => :destroy

  has_many :users, :through => :user_facility_bookings
  has_many :user_facility_bookings, :dependent => :destroy
end