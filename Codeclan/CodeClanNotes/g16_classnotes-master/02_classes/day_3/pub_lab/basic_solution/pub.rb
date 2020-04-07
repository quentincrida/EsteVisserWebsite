class Pub

  attr_reader :name, :till

  def initialize(name, till)
    @name = name
    @till = till
    @drinks = []
  end

  def drink_count
    return @drinks.count
  end

  def add_drink(drink)
    @drinks << drink
  end

  def serve(customer, drink)
    first_index_of_drink = @drinks.index(drink)
    drink_is_not_in_stock = first_index_of_drink.nil?
    return if drink_is_not_in_stock
    @drinks.delete_at(first_index_of_drink)
    customer.buy(drink)
    @till += drink.price()
  end

end
