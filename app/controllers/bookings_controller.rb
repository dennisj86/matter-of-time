class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new show]
  before_action :user, only: %i[index show new create]

  def index
    @user = current_user
    @messages = @user.all_messages
    @booking = policy_scope(Booking)
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

  #def market
    #@market = Market.find(params[:market_id])
  #end

  def user
    @user = current_user
  end

  def booking_params
    params.require(:booking).permit(:date, :status)
  end
end
