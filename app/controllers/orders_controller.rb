class OrdersController < ApplicationController
  before_action :fetch_orders

  def index
  end

  def update
    @order = Order.find(params[:id])
    if @order.status == 2
      @order.update_attribute(:courier, params[:courier].to_i)
    end
    @order.update_attribute(:status, params[:status].to_i)
    render :index
  end

  def transport
    @order = Order.find(params[:id])
  end

private
  def fetch_orders
    @orders = Order.all
    @processing = @orders.includes(:items).where(status: 1)
    @packed = @orders.includes(:items).where(status: 2)
    @picked = @orders.includes(:items).where(status: 3)
    @delivered = @orders.includes(:items).where(status: 4)
  end

  def order_params
    params.require(:order).permit(:status, :courier)
  end
end
