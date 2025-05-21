class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :number_guests, presence: true, numericality: { only_integer: true }
# greater_than 0
  validates :price, presence: true
end
