class UsersController < ApplicationController

  def new
    @user = User.new
    redirect_to(root_path, notice: "You're already logged in") if session[:user_id]
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new user_params
    if @user.save
      # UserMailer.register.deliver
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
