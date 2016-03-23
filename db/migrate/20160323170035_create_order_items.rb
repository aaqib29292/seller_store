class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :price_per_item
      t.integer :status
      t.references :Order, index: true, foreign_key: true
      t.references :Product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
