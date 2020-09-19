class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def edit
    if @user != current_user
      redirect_to user_path, alert: '不正なアクセスです。' 
    end
  end

  def update
    if @user.update(user_params)
       redirect_to user_path(@user)
    else
      render :edit
    end
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :profile, :image)
  end
end
