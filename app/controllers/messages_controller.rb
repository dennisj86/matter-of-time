class MessagesController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    @booking = Booking.find(params[:booking_id])
    @message_read = Message.where("booking_id = #{@booking.id} AND user_id != #{current_user.id}")
    @message_read.each do |message|
      message.status = true
      message.save
    end
    @message = Message.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    @message.booking = @booking
    @message.user = current_user
    authorize @message
    if @message.save
      BookingChannel.broadcast_to(
        @booking,
        render_to_string(partial: "message", locals: { message: @message})
      )

      redirect_to booking_messages_path(@booking)
    else
      render "messages/index"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
