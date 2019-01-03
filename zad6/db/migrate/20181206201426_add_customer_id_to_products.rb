class AddCustomerIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :customer_id, :integer
  end
end
