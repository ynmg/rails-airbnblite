class Listing < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :number_guests, presence: true, numericality: { only_integer: true }
# greater_than 0
  validates :price, presence: true
  validates :address, presence: true
end
