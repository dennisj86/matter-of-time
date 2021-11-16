class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new show]
  before_action :user, only: %i[index show new create]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @bookings = Booking.where(user: @user.id)
  end

  def new
    @market = Market.find(params[:market_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @market = Market.find(params[:market_id])
    @booking.market = @market
    @booking.user = @user
    @booking.save
    if @booking.save
      redirect_to messages_path(@dashboard) #to Dashboard Messages
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def update
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_index_path(@user.id)
  end

  private

  def market
    @market = Market.find(params[:market_id])
  end

  def user
    @user = current_user
  end

  def booking_params
    params.require(:booking).permit(:date, :status)
  end
end
