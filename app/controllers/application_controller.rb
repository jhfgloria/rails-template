class ApplicationController < ActionController::Base
  before_action :ensure_user_has_workspace
  before_action :ensure_user_completes_profile

  def ensure_user_has_workspace
    return unless user_signed_in?
    redirect_to new_workspace_path, notice: 'Create your first workspace' unless current_user.workspace?
  end

  def ensure_user_completes_profile
    return unless user_signed_in?
    redirect_to user_path(current_user), notice: 'Please complete your profile' unless current_user.profile_complete?
  end

  def current_workspace; current_user.workspace end

  def record_not_found; render file: "#{Rails.root}/public/404.html", layout: true, status: :not_found; end

  def set_title(title); @title = title; end

  def turbo_replace(frame, partial, locals); { turbo_stream: turbo_stream.replace(frame, partial:, locals:) }; end
  def turbo_append(frame, partial, locals); { turbo_stream: turbo_stream.append(frame, partial:, locals:) }; end
  def turbo_prepend(frame, partial, locals); { turbo_stream: turbo_stream.prepend(frame, partial:, locals:) }; end
end
