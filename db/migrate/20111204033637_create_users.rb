class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :nickname
      t.string :basecamp_token
      t.string :basecamp_login
      t.string :basecamp_password
      t.integer :basecamp_id
      t.boolean :synced
      t.boolean :admin
      t.boolean :authorized

      t.timestamps
    end
  end
end
