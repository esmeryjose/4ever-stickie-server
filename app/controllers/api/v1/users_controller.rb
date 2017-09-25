class Api::V1::UsersController < ApplicationController
  before_action :set_user, only:[:update]
  skip_before_action :authorized, only: [:create]

  def create
    user = User.create(user_params)
    now_render(user)
  end

  def update
    @user.update(user_params)
    now_render(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :username, :password)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
