require_relative "product.rb"

class Order

  attr_reader :products, :total_sum
  

  def initialize
    @products = []
    @status = :open
    @total_sum = 0
  end 

  def calculate_sum
    @total_sum = products.reduce(0) do |sum, product|
      sum += product.price
    end
  end

  def add_product(product)
    if open?
      @products << product
    else
      "order is finalized"
    end
  end

  def remove_product(product)
    if open?
      @products.delete(product)
    else
      "order is finalized"
    end
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
