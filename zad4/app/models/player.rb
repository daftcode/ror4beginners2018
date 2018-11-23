class Player < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :power, inclusion: 1..100
end
