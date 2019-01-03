class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :condition
      t.decimal :price, precision: 8, scale: 2, default: 0

      t.timestamps
    end
  end
end
