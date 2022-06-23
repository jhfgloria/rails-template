class HomeController < ApplicationController
  skip_before_action :ensure_user_has_workspace

  def index; end
end
