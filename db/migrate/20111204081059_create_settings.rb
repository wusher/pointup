class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :basecamp_url

      t.timestamps
    end
  end
end
