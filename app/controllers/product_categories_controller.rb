class ProductCategoriesController < ApplicationController
  def index
    @product_categories = ProductCategory.all
  end

  def new
    @product_category = ProductCategory.new
  end

  def analytics
   @product_categories = ProductCategory.all

   #Count of Product categories ordered
   items = OrderItem.all
   @categories_data = {}
   @product_categories.each do |category|
     categories_count = 0
     category.products.each do |product|
       categories_count += product.items.count
     end
     @categories_data["#{category.name}"] = categories_count
   end
  end
end
