class Reservation < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :people_number, presence: true, numericality: true

  belongs_to :user
  belongs_to :room
end
