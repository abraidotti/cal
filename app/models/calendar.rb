class Calendar < ApplicationRecord
  belongs_to :user
  has_many :trips, through: :user
end
