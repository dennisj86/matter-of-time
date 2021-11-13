class PagesController < ApplicationController
  include Pundit
  skip_after_action :verify_authorized, only: [:home]

  def home
  end
end
