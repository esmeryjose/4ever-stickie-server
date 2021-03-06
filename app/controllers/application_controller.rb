class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authorized

 private

  def issue_token(payload)
    JWT.encode(payload, ENV["SOME_SECRET"], ENV["SOME_SUPER_SECRET"])
  end

  def decode(jwt_token)
    JWT.decode(jwt_token, ENV["SOME_SECRET"], true, { algorithm: ENV["SOME_SUPER_SECRET"]})
  end

  def current_user_id
    authenticate_or_request_with_http_token do |jwt_token, options|
      decoded_token = decode(jwt_token)
      current_user_id = decoded_token[0]["user_id"]
    end
  end

  def current_user
    authenticate_or_request_with_http_token do |jwt_token, options|
      begin
        decoded_token = decode(jwt_token)
      rescue JWT::DecodeError
        return nil
      end
      if decoded_token[0]["user_id"]
        @current_user ||= User.find(decoded_token[0]["user_id"])
      end
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: {message: "Not welcome" }, status: 401 unless logged_in?
  end

  def user_with_token(user)
    payload = {user_id: user.id}
    token = issue_token(payload)
    newUser = UserSerializer.new(user).attributes
    { jwt: token, currentUser: newUser }
  end

  def now_render(object)
    if object.errors.any?
      render json: {errors: object.errors.messages}, status: 422
    else
      object = user_with_token(object) if params[:controller] == "api/v1/users" && params[:action] == "create"
      render json: object
    end
  end

end
