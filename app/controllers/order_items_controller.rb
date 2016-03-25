class OrderItemsController < ApplicationController
  def index
    @orders = Order.all
  end
end
