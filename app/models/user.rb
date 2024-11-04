class User < ApplicationRecord
  # Validations
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :password, presence: true, length: {minimum: 6}, if: :password_required?

  has_secure_password

  private

  # Ensure password validation is required only on create or when changing the password
  def password_required?
    new_record? || !password.nil?
  end
end