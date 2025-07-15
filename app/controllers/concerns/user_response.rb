# frozen_string_literal: true

module UserResponse
  extend ActiveSupport::Concern

  private

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
