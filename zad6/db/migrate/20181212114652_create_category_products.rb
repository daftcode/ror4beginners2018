class CreateCategoryProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :category_products do |t|
      t.references :category, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
