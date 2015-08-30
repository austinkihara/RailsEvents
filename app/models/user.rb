class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :location, :password, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  has_many :events, dependent: :destroy
  has_many :joins, dependent: :destroy

  has_many :events, through: :joins, source: :event
  has_many :comments, dependent: :destroy
end
