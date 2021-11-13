class MessagesController < ApplicationController
  def index
    @user = current_user
    @messages = @user.all_messages
    @bookings = Booking.joins(:market).where("markets.user_id = #{@user.id} OR bookings.user_id = #{@user.id}").all
    @markets = Market.where(user: @user.id)
    skip_policy_scope
  end
end
