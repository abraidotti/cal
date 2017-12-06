class CreateJoinTableEventsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :events_users do |t|
      t.belongs_to :event
      t.belongs_to :user
    end
  end
end
