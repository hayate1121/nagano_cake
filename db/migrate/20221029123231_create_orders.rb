class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.integer :payment_method
      t.integer :status, default: 0
      t.integer :shipping_cost
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :total_payment

      t.timestamps
    end
  end
end
