class SessionsController < ApplicationController
  include UserResponse

  skip_before_action :authenticate_user!, only: [ :create ]

  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: {
        user: user_response(user),
        token: token,
        message: "Login successful"
      }, status: :ok
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  def destroy
    # Since we're using stateless JWT, logout is handled client-side
    # by removing the token. We could implement token blacklisting here if needed.
    render json: { message: "Logout successful" }, status: :ok
  end
end
