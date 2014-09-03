class HouseFacilityR < ActiveRecord::Base
	validates :house_id, :uniqueness => {:scope => :facility_id}
	belongs_to :house
	belongs_to :facility
end
