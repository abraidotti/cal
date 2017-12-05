class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :description
      t.string :location
      t.decimal :cost, precision: 10, scale: 2
      t.integer :duration
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
