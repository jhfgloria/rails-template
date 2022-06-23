class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one :user_workspace
  delegate :workspace, to: :user_workspace, allow_nil: true

  validates :email, email: true, presence: true, uniqueness: true
  validates :name, :pronoun, presence: true, on: :update

  scope :with_accepted_invitation, -> { where("invitation_created_at is null OR invitation_accepted_at is not null") }

  def invite
    self.invite!
  rescue ActiveRecord::RecordNotUnique
    self.errors.add(:email, :duplicate, message: 'This email has been taken')
  end

  def invited?; self.invitation_created_at?; end

  def workspace?; self.workspace.present?; end

  def profile_complete?; self.email.present? && self.name.present? && self.pronoun.present?; end
end
