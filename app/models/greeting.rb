class Greeting < ApplicationRecord
  belongs_to :user
  belongs_to :design
  belongs_to :event
end
