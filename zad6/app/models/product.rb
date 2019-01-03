class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  serialize :image, JSON 
  belongs_to :user, optional: true
  has_and_belongs_to_many :category # optional: true, counter_cache: true

  validates :name, :description, :category, :price, presence: true
  validates :description, length: { maximum: 500, too_long: "%{count} characters is the maximum"}
  validates :name, length: {maximum: 50, too_long: "%{count} characters is the maximum"}
  validates :price, numericality: {greater_than: 0}, length: { maximum: 8 }

end
