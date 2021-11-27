class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :markets, dependent: :destroy
  has_many :market_bookings, through: :markets, source: :bookings
  has_many :bookings
  has_many :messages
  has_one_attached :photo

  def unread_messages
    Message.joins(booking: :market).where("(markets.user_id = #{id} OR bookings.user_id = #{id}) AND messages.user_id != #{id} AND messages.status = false")
  end

  def all_messages
    Message.joins(booking: :market).where("markets.user_id = #{id} OR bookings.user_id = #{id}")
  end
end
