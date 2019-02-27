class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }

  has_many :designs, dependent: :destroy
  has_many :invites, through: :designs
  has_many :events, through: :designs
  has_many :invites, dependent: :destroy
end
