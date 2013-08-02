class UsersController < ApplicationController
    def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find_by(params[:id])
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bench, :squat, :deadlift, :overhead_press)
  end



end
