require_relative "product.rb"
require_relative "category.rb"
require_relative "order.rb"

product = Product.new("Lasis", 100, 1)
product.category
puts "Created product #{product.name} with price: #{product.price}"

second_product = Product.new("Maize", 10, 3)
product.category
puts "Created product #{second_product.name} with price: #{second_product.price}"

third_product = Product.new("Piens", 20, 5)
product.category
puts "Created product #{third_product.name} with price: #{third_product.price}"

fourth_product = Product.new("Kafija", 50, 6)
product.category
puts "Created product #{fourth_product.name} with price: #{fourth_product.price}"

order = Order.new
order.add_product(product)
order.add_product(second_product)
order.add_product(third_product)
puts order.inspect

order.calculate_sum
puts "Total sum: #{order.calculate_sum}"

order.finalize!
puts "Order is: #{order.finalize!}"

order.add_product(fourth_product)
puts order.add_product(fourth_product)

order.calculate_sum
puts "Total sum: #{order.calculate_sum}"


# puts "------------------------------------------------"

# puts order.add_product(product)
# puts order.remove_product(product)
# puts order.calculate_sum