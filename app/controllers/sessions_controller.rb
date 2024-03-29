class SessionsController < ApplicationController

  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def new
    redirect_to(root_path, notice: "You're already logged in") if session[:user_id]
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Hello"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
