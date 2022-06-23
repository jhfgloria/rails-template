class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action { set_title('Dashboard') }
  layout 'dashboard'

  def index; end
end
