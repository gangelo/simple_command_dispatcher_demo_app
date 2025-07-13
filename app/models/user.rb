class User < ApplicationRecord
  ROLE_USER = 0
  ROLE_ADMIN = 1

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true

  enum :role, user: ROLE_USER, admin: ROLE_ADMIN, default: ROLE_USER
end
