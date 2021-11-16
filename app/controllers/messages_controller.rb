class MessagesController < ApplicationController
  def index
    @user = current_user
    @messages = @user.all_messages
    @bookings = Booking.joins(:market).where("markets.user_id = #{@user.id} OR bookings.user_id = #{@user.id}").all
    @markets = Market.where(user: @user.id)
    skip_policy_scope
  end

  def new
    @booking = Booking.new(booking_params)
    @booking = Booking.find(params[:booking_id])
    @market = Market.find(params[:market_id])
    @message = Message.new
    authorize @message
  end

  def create
    @booking = Booking.new(booking_params)
    @booking = Booking.find(params[:booking_id])
    @market = Market.find(params[:market_id])
    @message = Message.new(message_params)
    @booking.market = @market
    @booking.message = @message
    @booking.user = @user
    @message.user = @user
    @booking.save
    @message.save
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :status)
  end

  def message_params
    params.require(:message).permit(:content, :status)
  end
end
