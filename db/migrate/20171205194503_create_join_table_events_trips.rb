class CreateJoinTableEventsTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :events_trips do |t|
      t.belongs_to :event
      t.belongs_to :trip
    end
  end
end
