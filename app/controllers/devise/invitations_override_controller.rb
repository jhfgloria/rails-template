class Devise::InvitationsOverrideController < Devise::InvitationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters; devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :pronoun]); end
end