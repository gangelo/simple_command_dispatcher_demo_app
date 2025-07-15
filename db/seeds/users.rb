# frozen_string_literal: true

User.find_or_create_by!(username: "juser") do |user|
  user.email      = "joe.user@somewhere.com"
  user.first_name = "Joe"
  user.last_name  = "User"
  user.password   = "password"
  user.role       = User::ROLE_USER
end

User.find_or_create_by!(username: "jadmin") do |user|
  user.email      = "joe.admin@somewhere.com"
  user.first_name = "Joe"
  user.last_name  = "Admin"
  user.password   = "password"
  user.role       = User::ROLE_ADMIN
end
