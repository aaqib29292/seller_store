class Product < ActiveRecord::Base
  belongs_to :product_category
  has_many :items, class_name: OrderItem.name
end
