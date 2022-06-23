class Workspace < ApplicationRecord
  has_many :user_workspaces, dependent: :delete_all
  has_many :users, through: :user_workspaces

  validates :name, presence: true, length: { maximum: 32 }
end
