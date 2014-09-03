class CreateHouseFacilityRs < ActiveRecord::Migration
  def change
    create_table :house_facility_rs do |t|
      t.integer :house_id
      t.integer :facility_id

      t.timestamps
    end
  end
end
