class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action { set_title('People') }
  skip_before_action :ensure_user_completes_profile, only: [:show, :update]
  layout 'dashboard'

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index; @users = current_workspace.users.with_accepted_invitation; end

  def show
    @user = current_workspace
              .users.with_accepted_invitation
              .find(params[:id])
    set_title("People: #{@user.name}")
  end

  def update
    @user = find_user(user_params[:id])
    result = @user.update(user_params)
    render turbo_replace('user_form', 'devise/form', user: @user, success: result)
  end

  private

  def find_user(id); User.find(id); end

  def user_params; params.require(:user).permit(:id, :name, :email, :pronoun); end
end
