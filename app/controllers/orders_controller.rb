class OrdersController < ApplicationController
  def index
    @customers = Customer.includes(orders: [:items]).all

    @orders = Order.all
    @processing = @orders.includes(:items).where(status: 1)
    @packed = @orders.includes(:items).where(status: 2)
    @picked = @orders.includes(:items).where(status: 3)
    @delivered = @orders.includes(:items).where(status: 4)
  end
end
