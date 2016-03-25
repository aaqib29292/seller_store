class CustomersController < ApplicationController
  def index
    @customers = Customer.includes(:orders).all
  end
end
