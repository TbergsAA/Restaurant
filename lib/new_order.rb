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

  def select_product
    input = gets.chomp
    order.add_product(input)
    puts "You selected: #{input}"
  end

  def print_menu
    puts "++++++++++MENU LIST++++++++++" 
    categories.each do |c|
      puts c.name
      print_products_menu(c)
    end
    puts "+++++++++++++++++++++++++++++"
    puts "Enter your products!"
  end

  def print_products_menu(category)
    puts "-----------------------------"
    category.products.each do |product|
      puts product.name
    end
  end

  def show_order
    puts "         YOUR ORDER           "
    puts "------------------------------"
    order.products.each do |p|
      puts p
    end
  end

  def finalize!
    puts "Would you like to finalize order? (y/n)"
    input = gets.chomp
    if input == 'y'
      @status = :close
      order.products.each do |p|
        puts "Total sum: #{p.price}"
        puts "Order is finalized!"  
      end
    else
      print_menu
    end
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
    snacks.add_product(Product.new("Garlic bread", 150, snacks))
    snacks.add_product(Product.new("Cheese plate", 500, snacks))
    snacks.add_product(Product.new("Meat plate", 500, snacks))
    snacks.add_product(Product.new("Home made potato chips", 400, snacks))
  end

  def build_salads
    salads = Category.new("Salads")
    self.categories << salads
    salads.add_product(Product.new("Vegetable Salad", 400, salads))
    salads.add_product(Product.new("Pasta Salad", 500, salads))
    salads.add_product(Product.new("Greek Salad", 300, salads))
    salads.add_product(Product.new("Tropical Turkey Salad", 600, salads))
  end

  def build_second_meal
    second_meals = Category.new("Second meals")
    self.categories << second_meals
    second_meals.add_product(Product.new("Salmon steak with grilled vegetables", 1000, second_meals))
    second_meals.add_product(Product.new("Grilled chicken fillet with rice", 700, second_meals))
    second_meals.add_product(Product.new("Beef sour cream sauce with french fries", 900, second_meals))
    second_meals.add_product(Product.new("Pork chop with boiled potatoes", 500, second_meals))
  end

  def build_drinks
    drinks = Category.new("Drinks")
    self.categories << drinks
    drinks.add_product(Product.new("Cola", 200, drinks))
    drinks.add_product(Product.new("Fanta", 200, drinks))
    drinks.add_product(Product.new("Sprite", 200, drinks))
    drinks.add_product(Product.new("Bear", 350, drinks))
    drinks.add_product(Product.new("Water", 100, drinks))
  end

end

new_order = NewOrder.new
new_order.print_menu

new_order.select_product
new_order.select_product
new_order.show_order
new_order.finalize!
new_order.select_product
new_order.select_product
new_order.show_order
new_order.finalize!


 
