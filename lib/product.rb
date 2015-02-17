require_relative "category.rb"

class Product
  attr_accessor :name, :price, :id, :category
  
  def initialize(name, price, id)
    @name = name
    @price = price
    @id = id
    @category = nil
  end

  def product_name
    @name = name
  end

  def product_prise
    @price = price
  end

  def product_id
    @id = id
  end

  def category
    @category  
  end

  def add_category(category)
    @category = category
  end
end



# cesu_beer = Product.new(name: "Cēsu", price: 200, id: 1)
# cesu_beer.print_category_name
# cesu_beer.print_name("Beer: ")

