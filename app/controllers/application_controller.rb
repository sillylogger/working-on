class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :redirect_with_flash

  def after_sign_in_path_for resource
    dashboard_path
  end

  def redirect_with_flash exception
    redirect_to root_path, alert: exception.message
  end

end
