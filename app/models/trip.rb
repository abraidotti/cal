class Trip < ApplicationRecord
  has_and_belongs_to_many :events
  belongs_to :user
  validates :name, presence: true, length: {minimum: 1, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 140}
  validates :duration, presence: true, length: {minimum: 1, maximum: 240, too_long: "%{count / 24} days is the maximum allowed for an event. Try breaking your event up into smaller ones." }
end
