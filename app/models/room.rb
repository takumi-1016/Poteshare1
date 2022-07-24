class Room < ApplicationRecord
  validates :room_name, presence: true
  validates :room_introduction, presence: true
  validates :room_price, presence: true, numericality: true
  validates :room_address, presence: true
  validates :room_image, presence:true

  belongs_to :user
  has_many :reservations
  mount_uploader :room_image, ImageUploader
  
end
