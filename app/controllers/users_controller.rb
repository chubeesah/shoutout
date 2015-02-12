class UsersController < ApplicationController

  def index
    @user = User.all
    render :index
  end

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.create(params.require("/users/new").permit(:username, :password, :email))
    redirect_to :action => :index
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User deleted!"
  end

  def followers
    other_user = User.find(params[:user_id])
    current_user.follow(other_user)
    redirect_to :root
  end

  def unfollow
    
  end

  private
  def user_params
     params.require(:user).permit(:username, :password)
  end
end
