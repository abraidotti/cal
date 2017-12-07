class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :trips
  validates :name, presence: true, length: {minimum: 1, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 140}
end
