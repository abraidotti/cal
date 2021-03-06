class User < ApplicationRecord
  has_many :trips
  has_and_belongs_to_many :events
  after_create :build_calendar

  def build_calendar
    Calendar.create(user_id: self.id)
    # Associations must be defined correctly for this syntax, avoids using ID's directly.
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
