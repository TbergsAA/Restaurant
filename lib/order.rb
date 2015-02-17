require_relative "product.rb"

class Order

  # attr_reader :products
  

  def initialize
    @products = []
  end 

  def total_sum
  
  end

  def add_product(product)
    @products << product
  end

  def remove_product(product)
    @products.delete(product) 
  end

  def finalize!

  end

  def products

  end
end

  # order = Order.new
  # order.products

  # product = Product.new("Užavas", 200, 1)
  # order.add_product(product)



# new_product = Product.new("alus", 200, 1)

# new_order = Order.new()

# new_order.add_product(new_product)

# puts new_order.remove_product(new_product)

# puts 