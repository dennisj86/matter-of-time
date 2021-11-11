class MarketsController < ApplicationController
  #authorize @market

  def index
    @markets = policy_scope(Market).order(created_at: :desc)
  end

  def new
  end

  def show
  end
end
