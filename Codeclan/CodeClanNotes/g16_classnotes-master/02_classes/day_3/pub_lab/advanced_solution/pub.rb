class Pub

  attr_reader :name, :till, :stock

  def initialize(name, till)
    @name = name
    @till = till
    @stock = Hash.new(0)
  end

  def stock_level(drink)
    return @stock[drink]
  end

  def add_drink(drink)
    if @stock.include?(drink)
      @stock[drink] += 1
    else
      @stock[drink] = 1
    end
  end

  def stock_value()
    total = 0
    for drink in @stock.keys
      total += (drink.price * @stock[drink])
    end
    return total
  end

  def serve(customer, drink)
    return if customer_too_young?(customer)
    return if customer_too_drunk?(customer)
    return if customer_cannot_afford_drink?(customer, drink)
    if @stock[drink] > 0
      customer.buy_drink(drink)
      @stock[drink] -= 1
      @till += drink.price()
    end
  end

  def customer_cannot_afford_drink?(customer, drink)
    return !customer.sufficient_funds?(drink)
  end

  def customer_too_young?(customer)
    return customer.age < 18
  end

  def customer_too_drunk?(customer)
    return customer.drunkenness >= 50
  end

end
