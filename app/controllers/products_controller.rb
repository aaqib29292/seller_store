class ProductsController < ApplicationController
  def index
    @product_categories = ProductCategory.all
  end

  def new

  end
end
