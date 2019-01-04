class Product < ApplicationRecord
	belongs_to :customer
	has_many :product_categories
	has_many :categories, through: :product_categories
	validates :name, presence: true
	validates :price, presence: true, numericality: {greater_than: 0.00}

	scope :sorted, -> {order(price: :desc, id: :asc)}
	scope :lower_than, -> (w) {where('price < ?', w)}
end
