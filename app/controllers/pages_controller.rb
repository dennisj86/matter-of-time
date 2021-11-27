class PagesController < ApplicationController
  #include Pundit
  skip_before_action :authenticate_user!, only: [:home]

  def home
    #@markets = policy_scope(Market)
    @markets = Market.all
    @user = current_user
  end
end
