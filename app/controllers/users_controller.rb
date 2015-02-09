class UsersController < ApplicationController

  def index
    @user = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    redirect_to users_path, notice: "User Created!"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User deleted!"
  end

  private
  def user_params
     params.require(:user).permit(:username, :password)
  end
end
