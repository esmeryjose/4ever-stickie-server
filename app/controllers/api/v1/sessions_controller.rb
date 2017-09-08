class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def show
    render json: current_user
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: user_with_token(user)
    else
      render json: { error: "You have enter the wrong username or password"}
    end
  end

end
