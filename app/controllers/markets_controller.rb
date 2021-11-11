class MarketsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :user, only: %i[index show new create]

  def index
    @markets = policy_scope(Market).order(created_at: :desc)
    @markets = Market.all
    if params[:category].present? && params[:category] != ""

      sql_query = "category ILIKE :category"
      @markets = Market.where(sql_query, category: "%#{params[:category]}%")
    end
  end

  def new
    @market = Market.new
  end

  def create
    #authorize @market
    @market = Market.new(market_params)
    @market.user = current_user
    @market.save

    if @market.save
      redirect_to market_path(@market.id)
    else
      render :new
    end
  end

  def update
  end

  def show
    @market = Market.find(params[:id])
  end


  private

  def user
    @user = current_user
  end

  def market_params
    params.require(:market).permit(:title, :category, :description, :offer_request)
  end
end
