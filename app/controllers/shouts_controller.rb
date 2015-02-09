class ShoutsController < ApplicationController
  before_action :set_shout, only: [:show, :edit, :update, :destroy, :patch, :put]
  # before_action :set_user


  def index
    @shouts = shouts.all
  end

  def show
    @shout = Shout.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { @post.to_json }
    end
  end

  def new
  end

  def edit
  end

  def create
  end

  def create
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @shout = Post.find(params[:id])
    end

    # def set_user
    #   @user = User.find(params[:user_id])
    # end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:shout).permit(:yell, :user_id)
    end
end