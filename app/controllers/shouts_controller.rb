class ShoutsController < ApplicationController
  before_action :set_shout, only: [:show, :edit, :update, :destroy, :patch, :put, :post]
  before_action :set_user


  def index
    
    @shouts = @user.shouts
  end

  def show
    @shout = Shout.find(params[:id])
    respond_to do |format|
      format.html { render :show }
    end
  end

  def new
    @shout = Shout.new
    # binding.pry
    render :new
  end

  def edit
    @post = Shout.find(params[:id])
    render :edit
  end

  def create
<<<<<<< HEAD
    @shout = Shout.new(params.require("/users/8/shouts").permit(:yell))
=======
    binding.pry
    @shout = Shout.new(params.require(:shout).permit(:yell))
>>>>>>> ae2019cc068d29a280361b47fe8f391e3ca3fb8b
    @shout.user_id = params[:user_id]
    @shout.save
    redirect_to user_shouts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shout
      @shout = Shout.find(params[:user_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def shout_params
    #   params.require(:shout).permit(:yell, :user_id, :id)
    # end
end