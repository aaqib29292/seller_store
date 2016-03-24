class OrdersController < ApplicationController
  def index
    @customers = Customer.includes(:orders).all
    @orders = @customers.orders
  end
end
