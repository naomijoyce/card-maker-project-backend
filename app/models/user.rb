class User < ApplicationRecord
  has_many :designs, dependent: :destroy
  has_many :events, through: :designs
  has_many :invites, dependent: :destroy
  has_many :designs, through: :invites
end
