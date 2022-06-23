module ApplicationHelper
  def current_workspace; current_user.workspace; end
end
