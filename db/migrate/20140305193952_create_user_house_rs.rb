class CreateUserHouseRs < ActiveRecord::Migration
  def change
    create_table :user_house_rs do |t|
      t.integer :user_id
      t.integer :house_id
      t.string 	:room_number
      t.string 	:name_plate
      t.boolean :is_living_now, :default => true
      t.boolean	:is_received_post_office_notification, :default => false
      t.boolean	:is_received_nearby_ads, :default => false

      t.timestamps
    end
  end
end
