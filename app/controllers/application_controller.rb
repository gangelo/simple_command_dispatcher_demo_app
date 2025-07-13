class ApplicationController < ActionController::API
  before_action :authenticate_user!

  private

  def current_user
    @current_user ||= decode_token
  end

  def user_authenticated?
    !!current_user
  end

  def authenticate_user!
    unless user_authenticated?
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def decode_token
    return nil unless auth_header

    token = auth_header.split(" ").last
    begin
      decoded = JWT.decode(token, jwt_secret, true, algorithm: "HS256")
      user_id = decoded[0]["user_id"]
      User.find(user_id)
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      nil
    end
  end

  def encode_token(payload)
    JWT.encode(payload, jwt_secret, "HS256")
  end

  def auth_header
    request.headers["Authorization"]
  end

  def jwt_secret
    Rails.application.credentials.secret_key_base || "fallback_secret"
  end
end
