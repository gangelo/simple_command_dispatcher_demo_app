module AuthHelpers
  def auth_headers(user)
    token = Authenticatable.encode_token({ user_id: user.id })
    { 'Authorization' => "Bearer #{token}" }
  end

  def login_user(user)
    post '/login', params: { username: user.username, password: user.password }
    JSON.parse(response.body)['token']
  end
end

RSpec.configure do |config|
  config.include AuthHelpers, type: :request
end
