class UsersController < ApplicationController
  include UserResponse

  skip_before_action :authenticate_user!, only: [ :create ]

  def create
    user = User.new(user_params)

    if user.save
      render json: {
        user: user_response(user),
        message: "User created successfully"
      }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def profile
    render json: { user: user_response(current_user) }
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation)
  end
end
