class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    "teste"
  end
end
