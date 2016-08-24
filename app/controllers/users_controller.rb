class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return redirect_to root_path unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
  end

  def edit
  end

  def update
    user = User.find(params[:user][:id])
    user.update(user_params)
    @user = user
    
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
