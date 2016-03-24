namespace :mock do
  desc "Mock placement of an order on behalf of a random customer"
  task place_order: :environment do
    puts "Mocking an Order placement"
    customer = Customer.all.sample
    products_count = rand(5) + 1
    products = Product.all.sample(products_count)
    order = customer.orders.create
    products_ordered = []
    products_cancelled = []
    products.each do |product|
      quantity = 1 + rand(3)
      if product.quantity > quantity
        order.items.create(product_id: product.id, quantity: quantity, status: OrderItem::Status.all.sample.code, price_per_item: product.price)
        products_ordered.push(product)
        # update product quantity
      else
        products_cancelled.push(product)
      end
    end
    puts "Placed an order for #{products_ordered.collect(&:name).join(', ')} on behalf of #{customer.name}" if products_ordered.length > 0
    puts "Cancelled an order for #{products_cancelled.collect(&:name).join(', ')} on behalf of #{customer.name}" if products_cancelled.length > 0
  end

end
