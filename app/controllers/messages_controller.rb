class MessagesController < ApplicationController
  def index
    @user = current_user
    @bookings = policy_scope(Booking).order(updated_at: :desc)
    @booking = Booking.find(params[:booking_id])
    @message_read = Message.where("booking_id = #{@booking.id} AND user_id != #{@user.id}")
    @message_read.each do |message|
      message.status = true
      message.save
    end
    @message = Message.new
    @messages = @booking.messages.order(:id)
  end

  def create
    @bookings = policy_scope(Booking).order(updated_at: :desc)
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    @message.booking = @booking
    @message.user = current_user
    authorize @message
    if @message.save
      @booking.updated_at = @message.created_at
      @booking.save
      BookingChannel.broadcast_to(
        @booking,
        messages_partial: render_to_string(partial: "message", locals: { message: @message}),
        bookings_partial: render_to_string(partial: "bookings", locals: { bookings: @bookings})
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
