class Reservation < ApplicationRecord
  validates :reservation_start, presence: true
  validates :reservation_end, presence: true
  validates :reservation_people, presence: true, numericality: true

  belongs_to :user
  belongs_to :room
end
