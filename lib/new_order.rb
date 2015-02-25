require_relative "product.rb"
require_relative "category.rb"
require_relative "order.rb"
require "pry"

class NewOrder

  attr_accessor :categories, :order, :name, :price, :id, :category

  def initialize
    self.categories = [] 
    build_menu
    @order = Order.new
    @status = :open
    @total_sum = 0
  end

  def find_product(id)
    selected_product = nil
      categories.each do |category|
          category.name
        category.products.each do |product|
            product.name
          if product.id.to_s == id.to_s
            selected_product = product
            return selected_product
          end
        end
    end
  end

  def select_product
    input = gets.chomp
    return finalize! if input == 'f'
    product = find_product(input)
    order.add_product(product)
    puts "You selected: #{product}"
    puts "If you want finalize order press > f <"
    select_product
  end


  def print_menu
    puts "++++++++++MENU LIST++++++++++" 
    categories.each do |c|
      puts c.name
      print_products_menu(c)
    end
    puts "+++++++++++++++++++++++++++++"
    puts "Enter products!"
  end

  def print_products_menu(category)
    puts "-----------------------------"
    category.products.each do |product|
      puts "#{product.id}) #{product.name} ===>  #{product.price}" 
    end
  end

  def show_order
    puts "         YOUR ORDER           "
    puts "------------------------------"
    order.products.each do |product|
      puts product.name
    end
    puts "------------------------------"
    puts "Total sum: #{order.calculate_sum / 100} EUR"
  end

  def finalize!
    @status = :close
    puts "Order is finalized!"
    show_order 
  end

  def build_menu
    build_snacks
    build_salads
    build_second_meal
    build_drinks
  end

  def build_snacks
    snacks = Category.new("Snacks")
    self.categories << snacks
    snacks.add_product(Product.new("Garlic bread", 150, 1))
    snacks.add_product(Product.new("Cheese plate", 500, 2))
    snacks.add_product(Product.new("Meat plate", 500, 3))
    snacks.add_product(Product.new("Home made potato chips", 400, 4))
  end

  def build_salads
    salads = Category.new("Salads")
    self.categories << salads
    salads.add_product(Product.new("Vegetable Salad", 400, 5))
    salads.add_product(Product.new("Pasta Salad", 500, 6))
    salads.add_product(Product.new("Greek Salad", 300, 7))
    salads.add_product(Product.new("Tropical Turkey Salad", 600, 8))
  end

  def build_second_meal
    second_meals = Category.new("Second meals")
    self.categories << second_meals
    second_meals.add_product(Product.new("Salmon steak with grilled vegetables", 1000, 9))
    second_meals.add_product(Product.new("Grilled chicken fillet with rice", 700, 10))
    second_meals.add_product(Product.new("Beef sour cream sauce with french fries", 900, 11))
    second_meals.add_product(Product.new("Pork chop with boiled potatoes", 500, 12))
  end

  def build_drinks
    drinks = Category.new("Drinks")
    self.categories << drinks
    drinks.add_product(Product.new("Cola", 200, 13))
    drinks.add_product(Product.new("Fanta", 200, 14))
    drinks.add_product(Product.new("Sprite", 200, 15))
    drinks.add_product(Product.new("Bear", 350, 16))
    drinks.add_product(Product.new("Water", 100, 17))
  end

end

new_order = NewOrder.new
new_order.print_menu

new_order.select_product

 
