class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, scale: 2, precision: 10
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
