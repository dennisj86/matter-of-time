class BookingsController < ApplicationController
  def index
    @user = current_user
    @messages = @user.all_messages
    @booking = policy_scope(Booking)
  end
end
