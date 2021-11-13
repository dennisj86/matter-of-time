class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :market
  has_many :messages, dependent: :destroy
  enum status: %i[pending requested confirmed rejected]
  #validates
end
