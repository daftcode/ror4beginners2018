class Category < ApplicationRecord
  has_and_belongs_to_many :products, dependent: :destroy
end
