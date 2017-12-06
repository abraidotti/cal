class AddUserAndCalendarIdToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :user_id, :integer
    add_column :trips, :calendar_id, :integer
  end
end
