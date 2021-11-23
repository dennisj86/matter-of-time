class MessagesController < ApplicationController
  def index
    # @user = current_user
    #@messages = @user.all_messages
    #@bookings = Booking.joins(:market).where("markets.user_id = #{@user.id} OR bookings.user_id = #{@user.id}").all
    #@markets = Market.where(user: @user.id)
    @bookings = policy_scope(Booking)
    @booking = Booking.find(params[:booking_id])
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

  def new
    #@booking = Booking.new(booking_params)
    #@booking = Booking.find(params[:booking_id])
    #@market = Market.find(params[:market_id])
    #@message = Message.new
    #authorize @message
  end

  #private

  #def booking_params
    #params.require(:booking).permit(:date, :status)
  #end

  #def message_params
    #params.require(:message).permit(:content, :status)
  #end
end
