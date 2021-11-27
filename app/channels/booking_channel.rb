class BookingChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    chat = Booking.find(params[:id])
    stream_for chat
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
