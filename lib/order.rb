require_relative "product.rb"

class Order

  attr_reader :products, :total_sum
  

  def initialize
    @products = []
    @status = :open
    @total_sum = 0
  end 

  def calculate_sum
    sum = 0
    products.map do |product|
      sum += product.price
    end
    @total_sum = sum 
  end

  def add_product(product)
    if open?
      @products << product
    else
      "order is finalized"
    end
  end

  def remove_product(product)
    @products.delete(product) 
  end

  def finalize!
    @status = :close  
  end

  def finalized?
    @status == :close
  end

  def open?
    @status == :open
  end
end
