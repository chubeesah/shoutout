class ShoutsController < ApplicationController
  before_action :set_shout, only: [:show, :edit, :update, :destroy, :patch, :put, :post]
  before_action :set_user


  def index
    @shouts = @user.shouts.all
  end

  # def show
  #   @shout = Shout.find(params[:id])
  #   render :show
  # end

  def new
    @shout = Shout.new
    # binding.pry
    render :new
  end

  def edit
    # @shout = Shout.find(params[:id])
    # render :edit
  end

  def create
    @shout = Shout.new(params.require(:shout).permit(:yell))
    @shout.user_id = params[:user_id]
    @shout.save
    redirect_to user_shouts_path
  end

  def update
    @shout.update(params.require(:shout).permit(:yell))
    @shout.save
    redirect_to user_shouts_path(@user, @shouts)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shout
      @shout = Shout.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def shout_params
    #   params.require(:shout).permit(:yell, :user_id, :id)
    # end
end