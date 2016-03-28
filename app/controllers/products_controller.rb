class ProductsController < ApplicationController
  before_action :fetch_product_category
  before_action :fetch_product, only: [:edit, :show, :update]

  def index
    @products = @product_category.products
  end

  def new
    @product = @product_category.products.new
  end

  def create
    @product = @product_category.products.new(product_params)
    @save_success = @product.save
    @products = @product_category.products
  end

  def edit
  end

  def update
    @save_success = @product.update_attributes(product_params)
  end

  def show
  end

  def analytics
   # Count of Products ordered for a category
   @products_data = {}
   @product_category.products.each do |product|
     products_count = product.items.count
     @products_data["#{product.name}"] = products_count
   end
  end
  
private
  def product_params
    params.require(:product).permit(:name, :quantity, :price)
  end

  def fetch_product_category
    @product_category = ProductCategory.find(params[:product_category_id])
  end

  def fetch_product
    @product = @product_category.products.find(params[:id])
  end
end
