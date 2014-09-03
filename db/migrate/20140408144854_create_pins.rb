class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string 	:title
      t.text 		:description
      t.string 	:type
      t.string 	:photo_url
      t.string 	:icon_url
      t.string  :from
      t.integer	:user_id
      t.integer	:house_id
      t.boolean	:is_sticky, :default => false

      t.timestamps
    end
  end
end
