class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action { set_title('Invitations') }
  layout 'dashboard'

  def index; @users = current_workspace.users end

  def create
    @user = User.new(invitations_params)
    errors = UserWorkspace.invite_user_to_workspace(@user, current_workspace)
    return render turbo_prepend('users', 'invitations/details', { user: @user }) if errors.blank?

    render turbo_replace('users_form', 'invitations/form', { user: @user, errors: errors.to_a })
  end

  private

  def invitations_params; params.require(:user).permit(:email) end
end
