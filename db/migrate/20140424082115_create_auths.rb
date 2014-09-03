class CreateAuths < ActiveRecord::Migration
  def change
    create_table :auths do |t|
      t.string :token
      t.string :secret
      t.integer :user_id
      t.timestamps
    end
    add_index :auths, :token, :unique => true
  end
end
