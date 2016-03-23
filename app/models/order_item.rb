class OrderItem < ActiveRecord::Base
  belongs_to :Order
  belongs_to :Product
end
