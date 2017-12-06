class Trip < ApplicationRecord
  has_and_belongs_to_many :events
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 5, maximum: 140}
end
