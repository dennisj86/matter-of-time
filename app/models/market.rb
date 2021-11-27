class Market < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  enum offer_request: %i[offer request]
  validates :title, :category, :description, :offer_request, presence: true
  validates :offer_request, numericality: true
  has_one_attached :photo
end
