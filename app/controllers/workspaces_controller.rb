class WorkspacesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :ensure_user_has_workspace
  skip_before_action :ensure_user_completes_profile, only: [:new, :create]
  layout 'dashboard'

  def new; @user_workspace = UserWorkspace.new_with_empty_workspace end

  def create
    @user_workspace = UserWorkspace.new(user_workspace_params).add_user(current_user)

    if @user_workspace.save
      redirect_to user_root_path, notice: 'Workspace created!'
      return
    end

    render :new
  end

  private

  def user_workspace_params; params.require(:user_workspace).permit(workspace_attributes: [:name]) end
end
