class UsersController < ApplicationController

  def index
    @user = User.all
    render :index
  end

  def new
    @user = User.new
  end

  def create
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
    if (other_user[:id] == current_user[:id])
      flash[:notice] = "You cannot follow yourself"
    elsif Relationship.exists?(follower_id: current_user[:id], followed_id: other_user[:id])
      flash[:notice] = "You are already following"
    else
      current_user.follow(other_user)
    end
    redirect_to :root
  end

  def unfollow
    if Relationship.exists?(follower_id: current_user[:id], followed_id: other_user[:id])
      current_user.unfollow(other_user)
    end
    redirect_to :root
  end

  private
  def user_params
     params.require(:user).permit(:username, :password)
  end

  def other_user
    @other_user = User.find(params[:user_id])
  end
end
