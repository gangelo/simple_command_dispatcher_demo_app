class UsersController < ApplicationController
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

  def user_response(user)
    {
      id: user.id,
      username: user.username,
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name,
      role: user.role
    }
  end
end
