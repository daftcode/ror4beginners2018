class Player < ApplicationRecord
<<<<<<< HEAD
  validates :first_name, :last_name, presence: true
  validates :power, presence: true, numericality: { greater_than: 0, less_than: 100 }
=======
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :power, numericality: {greater_than: 0, less_than: 99}
>>>>>>> add model + migration
end
