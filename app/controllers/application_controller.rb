class ApplicationController < ActionController::API
  include Authenticatable

  rescue_from UnauthorizedError, with: :handle_unauthorized

  private

  def handle_unauthorized(exception)
    render json: { errors: [ exception.message ] }, status: :unauthorized
  end
end
