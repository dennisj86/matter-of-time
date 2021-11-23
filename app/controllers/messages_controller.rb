class MessagesController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    @booking = Booking.find(params[:booking_id])
    @message = Message.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    @message.booking = @booking
    @message.user = current_user
    @message.status = false
    authorize @message
    if @message.save
      redirect_to booking_path(@booking)
    else
      render "messages/index"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
