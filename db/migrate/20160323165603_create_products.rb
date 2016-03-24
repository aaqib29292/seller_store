class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.integer :price
      t.references :product_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
