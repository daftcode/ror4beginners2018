class Product < ApplicationRecord
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
  belongs_to :customer, optional: true

  scope :cheaper_than, ->(price) { where('price < ?', price) }
  scope :sorted, -> { order(price: :desc) }
end
