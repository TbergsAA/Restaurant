class Product

  def list
    []
  end

  def create(name, price, category)
    list << {name: name, price: price, category_id: category}
  end

end