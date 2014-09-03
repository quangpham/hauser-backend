class CreateUserFacilityBookings < ActiveRecord::Migration
  def change
    create_table :user_facility_bookings do |t|
      t.integer 	:user_id
      t.integer 	:facility_id
      t.date 			:booking_date
      t.string 	  :booking_slot

      t.string    :facility_name
      t.string    :facility_thumbnail

      t.timestamps
    end
  end
end
