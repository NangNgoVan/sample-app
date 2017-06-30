class User < ApplicationRecord
  before_save :email_downcase

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,
    length: {maximum: Settings.User.name_length_max}
  validates :email, presence: true,
    length: {maximum: Settings.User.email_length_max},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.User.password_length_min}

  has_secure_password

  def email_downcase
    email.downcase!
  end
end
