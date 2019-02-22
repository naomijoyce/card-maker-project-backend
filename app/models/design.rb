class Design < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :invites, dependent: :destroy
  has_many :users, through: :invites
end
