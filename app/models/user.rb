class User < ActiveRecord::Base
  
  
  attr_accessor :password_confirmation, :password
  before_save :encrypt_password
  
  validates :password_confirmation,
    presence: true,
    if: "password.present?"
  validates :password,
    confirmation: true,
    length: { minimum: 5, maximum: 72 },
    if: "password.present?"
  validates :password_hash, presence: true
  validates :password_salt, presence: true
  validates :email,
    presence: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
    uniqueness: { case_sensitive: false }
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def self.authenticate email, password
    user = find_by_email email
    if user
      user if user.authenticate password
    end
  end
  
  def authenticate password
    hash = BCrypt::Engine.hash_secret password, password_salt
    hash == password_hash
  end
  
  # Permission levels
  def editor?; privileges >= 0; end
  def admin?; privileges >= 1; end
end
