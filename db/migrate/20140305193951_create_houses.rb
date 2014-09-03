class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string 	:address
      t.text 		:description
      t.string 	:thumbnail
      t.timestamps
    end
  end
end
