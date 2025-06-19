class User < ApplicationRecord
  has_many :ratings
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
