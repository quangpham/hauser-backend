class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string 	:name
      t.text 		:description
      t.string 	:facility_type
      t.string 	:thumbnail

      t.timestamps
    end
  end
end
