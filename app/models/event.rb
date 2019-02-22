class Event < ApplicationRecord
  has_one :invite
  has_many :designs, dependent: :destroy
  has_many :users, through: :designs
end
