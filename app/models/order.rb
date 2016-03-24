class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :items, class_name: OrderItem.name
end
