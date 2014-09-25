class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  include Pundit
  protect_from_forgery with: :exception

  after_action :verify_authorized, :except => :index
  # after_action :verify_policy_scoped, :only => :index

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  def require_login
    if current_user.nil?
      redirect_to login_url(goto: request.path), flash: { error: "You must first sign in to access this page" }
    end
  end

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def not_authorized
    if current_user
      flash[:error] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    else
      redirect_to login_url, alert: "please login first"
    end
  end

end
