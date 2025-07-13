module AuthHelpers
  def auth_headers(user)
    token = JWT.encode({ user_id: user.id }, jwt_secret, 'HS256')
    { 'Authorization' => "Bearer #{token}" }
  end

  def login_user(user)
    post '/login', params: { username: user.username, password: user.password }
    JSON.parse(response.body)['token']
  end

  def jwt_secret
    Rails.application.credentials.secret_key_base || 'fallback_secret'
  end
end

RSpec.configure do |config|
  config.include AuthHelpers, type: :request
end
