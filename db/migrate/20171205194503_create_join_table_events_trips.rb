class CreateJoinTableEventsTrips < ActiveRecord::Migration[5.1]
  def change
    create_join_table :events, :tripss do |t|
      t.index [:event_id, :trip_id]
      t.index [:trip_id, :event_id]
    end
  end
end
