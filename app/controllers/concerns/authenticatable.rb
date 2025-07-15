# frozen_string_literal: true

# This module provides authentication functionality for controllers.
# It uses JWT for token-based authentication and provides methods to encode tokens,
# authenticate users, and access the current user.
#
# Usage:
# Include this module in your controllers to enable authentication.
# The `current_user` method will return the authenticated user, if any.
module Authenticatable
  extend ActiveSupport::Concern

  ENCODING_ALGORITHM = "HS256"

  included do
    before_action :authenticate_user!
  end

  def encode_token(payload)
    JWT.encode(payload, jwt_secret, ENCODING_ALGORITHM)
  end

  def jwt_secret
    Rails.application.credentials.secret_key_base ||
      Rails.application.secret_key_base ||
      "fallback_secret"
  end
  module_function :encode_token, :jwt_secret
  private_class_method :jwt_secret

  def current_user
    @current_user
  end

  def user_authenticated?
    current_user.present?
  end

  private

  def authenticate_user!
    token = extract_token
    raise UnauthorizedError, "Token not provided" unless token

    @current_user = decode_and_find_user(token)
  rescue JWT::DecodeError
    raise UnauthorizedError, "Invalid or expired token"
  rescue ActiveRecord::RecordNotFound
    raise UnauthorizedError, "User not found"
  end

  def extract_token
    auth_header = request.headers["Authorization"]
    return nil unless auth_header&.start_with?("Bearer ")

    auth_header.split(" ").last
  end

  def decode_and_find_user(token)
    decoded_token = JWT.decode(token, jwt_secret, true, { algorithm: ENCODING_ALGORITHM })
    user_id = decoded_token.dig(0, "user_id")

    raise ActiveRecord::RecordNotFound unless user_id

    User.find(user_id)
  end
end
