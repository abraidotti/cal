class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :trips
  validates :name, presence: true, length: {minimum: 1, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 140}
  validates :duration, presence: true, length: {minimum: 1, maximum: 12, too_long: "%{count} hours is the maximum allowed for an event. Try breaking your event up into smaller ones." }
  accepts_nested_attributes_for :trips

  geocoded_by :location
  after_validation :geocode
end
