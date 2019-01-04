class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.float :price, null: false
      t.string :name, null: false

      t.belongs_to :customer, index: true
      t.timestamps
    end
  end
end
