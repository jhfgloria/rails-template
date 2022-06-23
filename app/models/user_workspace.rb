class UserWorkspace < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  accepts_nested_attributes_for :workspace

  def self.new_with_empty_workspace; UserWorkspace.new { |user_workspace| user_workspace.workspace = Workspace.new } end

  def self.invite_user_to_workspace(user, workspace)
    UserWorkspace.new(workspace: workspace, user: user)
    user.invite
    user.errors unless user.valid?(:create)
  end

  def add_user(user); self.tap { |user_workspace| user_workspace.user = user } end
end
