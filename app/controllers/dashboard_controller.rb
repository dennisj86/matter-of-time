class DashboardController < ApplicationController
  def index
    @user = current_user
    @messages = Message.where(user: @user.id)
    @bookings = Booking.where(user: @user.id)
    @markets = Market.where(user: @user.id)
    skip_policy_scope
  end
end
