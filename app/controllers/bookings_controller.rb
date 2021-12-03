class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new show]
  before_action :user, only: %i[index show new create]

  def index
    @user = current_user
    @messages = @user.all_messages
    @bookings = policy_scope(Booking).order(updated_at: :desc)

  end

  def new
    @market = Market.find(params[:market_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @market = Market.find(params[:market_id])
    @booking = Booking.new(market_id: @market.id, user_id: current_user.id, status: "pending")
    @booking.messages.build(content: params[:message_text], user_id: current_user.id)
    authorize @booking
    if @booking.save
      flash[:notice] = "Message sent"
      redirect_to market_path(@market.id)
    else
      flash[:alert] = "Something went wrong. Please try again."
      redirect_to market_path(@market.id)
    end
  end

  def show
    @bookings = policy_scope(Booking)
    @booking = Booking.find(params[:id])
    @message = Message.new
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    case @booking.status
    when "pending"
      @booking.status = 1
    when "requested", "rejected"
      @booking.status = 2
    when "confirmed"
      @booking.status = 3
    end
    @booking.save
    redirect_to booking_messages_path(@booking), notice: "Booking #{@booking.status}"
  end

  def destroy

    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to "/bookings"
  end

  private

  def user
    @user = current_user
  end

  def booking_params
    params.require(:booking).permit(:date, :status)
  end
end
