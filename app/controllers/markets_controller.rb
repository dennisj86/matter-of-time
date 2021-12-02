class MarketsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :user, only: %i[index show new create]

  def index
    @markets = policy_scope(Market).order(created_at: :desc)
    #@markets = Market.all
    if params[:category].present? && params[:category] != ""

      sql_query = "category ILIKE :category"
      @markets = Market.where(sql_query, category: "%#{params[:category]}%")
    elsif
      params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @markets = Market.where(sql_query, query: "%#{params[:query]}%")
    else
      @markets = Market.all
    end
  end

  def new
    @market = Market.new
    authorize @market
  end

  def create
    @market = Market.new(market_params)
    authorize @market
    @market.user_id = current_user.id
    @market.offer_request = 0
    if @market.save
      redirect_to market_path(@market)
    else
      render :new
    end
  end

  def update
  end

  def show
    @market = Market.find(params[:id])
    authorize @market
    @booking = Booking.find_by(market: @market, user: current_user)
    respond_to do |format|
      format.html
      format.js
    end
  end


  private

  def user
    @user = current_user
  end

  def market_params
    params.require(:market).permit(:title, :category, :description, :photo)
  end
end
