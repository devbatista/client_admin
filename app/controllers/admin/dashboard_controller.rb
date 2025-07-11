class Admin::DashboardController < Admin::BaseAdminController
  before_action :authenticate_user!

  def index; end
end
