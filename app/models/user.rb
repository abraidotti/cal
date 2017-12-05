class User < ApplicationRecord
  has_one :calendar
  has_many :trips, dependent: :destroy
  has_many :events
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
