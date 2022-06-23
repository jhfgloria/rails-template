class SessionsController < Devise::SessionsController
  skip_before_action :ensure_user_has_workspace
end
