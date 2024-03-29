class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
    redirect_to(root_path, notice: "You're already logged in") if session[:user_id]
  end

  def create
    @user = User.new user_params
    authorize @user
    if @user.save
      UserMailer.register.deliver_now
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    if @user.update_attributes user_params
      session[:user_id] = @user.id
      redirect_to @user, notice: "updated"
    else
      render "edit"
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
