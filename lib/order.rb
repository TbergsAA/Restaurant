require_relative "product.rb"

class Order

  attr_reader :new_order, :products

  def initialize
    @products = Product.new
    @new_order = []
  end 

  def total_sum

  end

  def add_product(product)
    @new_order << product
  end

  def remove_product(product)
    @new_order.delete(product) 
  end

  def finalize!

  end
end

# load "lib/order.rb"
# order = Order.new