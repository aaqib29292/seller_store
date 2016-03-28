class OrdersController < ApplicationController
  before_action :fetch_orders

  def index
  end

  def update
    status = (params[:status] || params[:order][:status]).to_i
    @order = Order.find(params[:id])
    if (status == 3) && params[:order] && params[:order][:courier]
      @order.update_attribute(:courier, params[:order][:courier].to_i)
    end
    @order.update_attribute(:status, status.to_i)
    render :index
  end

  def transport
    @order = Order.find(params[:id])
    @order.status = 3
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
