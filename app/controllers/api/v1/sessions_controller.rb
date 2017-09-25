class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def show
    render json: current_user
  end

  def create
    response = nil
    user = User.find_by(username: params[:username])
    user && user.authenticate(params[:password]) ?
      response = user_with_token(user) :
      response = { error: "You have enter the wrong username or password"}

    render json: response
  end

end
