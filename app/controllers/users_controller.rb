class UsersController < ApplicationController
  before_action :set_user, only:[:update, :show]

  def create
    user = User.create(user_params)
    render json: user
  end

  def show
    render json: @user
  end

  def update
    @user = User.update(user_params)
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :username, :password)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
