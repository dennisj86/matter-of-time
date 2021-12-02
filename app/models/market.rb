class Market < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  enum offer_request: %i[offer request]
  validates :title, :category, :description, presence: true
  has_one_attached :photo
end
