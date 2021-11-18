class MessagesController < ApplicationController
  def index
    # @user = current_user
    #@messages = @user.all_messages
    #@bookings = Booking.joins(:market).where("markets.user_id = #{@user.id} OR bookings.user_id = #{@user.id}").all
    # @markets = Market.where(user: @user.id)
    @booking = policy_scope(Booking).where(id: params[:id])

  end

  def create
    @booking = Booking.find(params[:id])
    @message = Message.new(message_params)
    @message.booking = @booking
    @message.user = current_user
    if message.save
      redirect_to booking_path(@booking, anchor: "message-#{message.id}")
    else
      render "messages/show"
    end
  end
end
