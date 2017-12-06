class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :description
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration
      t.integer :cost
      t.integer :user_id
      t.timestamps
    end
  end
end
