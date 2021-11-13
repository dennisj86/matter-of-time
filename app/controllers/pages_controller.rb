class PagesController < ApplicationController
  include Pundit
  skip_after_action :verify_authorized, only: [:home]

  def home
    @markets = policy_scope(Market)
    @markets = Market.all
  end
end
