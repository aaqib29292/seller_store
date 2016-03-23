class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.references :Customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
