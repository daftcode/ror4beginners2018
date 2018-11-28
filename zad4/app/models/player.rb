class Player < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :power, numericality: {greater_than: 0, less_than: 99}
end
