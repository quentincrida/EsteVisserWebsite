require_relative('../db/sql_runner.rb')
require_relative('./customer.rb')

class PizzaOrder

  attr_accessor :topping, :quantity, :customer_id
  attr_reader :id

  def initialize(order)
    @id = order['id'].to_i() if order['id']
    @topping = order['topping']
    @quantity = order['quantity'].to_i()
    @customer_id = order['customer_id'].to_i()
    @price = 10
  end


  def total()
    return @quantity * @price
  end

  def save()
    sql = "INSERT INTO pizza_orders
    (topping, quantity, customer_id, price)
    VALUES ($1, $2, $3, $4) RETURNING id"

    values = [@topping, @quantity, @customer_id, @price]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def PizzaOrder.delete_all()
    sql = "DELETE FROM pizza_orders"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM pizza_orders WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()

    sql = "UPDATE pizza_orders SET
    (topping, quantity, customer_id, price) = ($1, $2, $3, $4)
    WHERE id = $5"

    values = [@topping, @quantity, @customer_id, @price, @id]

    SqlRunner.run(sql, values)
  end

  # Could be PizzaOrder.all(). self == PizzaOrder
  def self.all()
    sql = "SELECT * FROM pizza_orders"

    orders = SqlRunner.run(sql)

    return orders.map{|order| PizzaOrder.new(order)}
  end

  def self.find(id)
    sql = "SELECT * FROM pizza_orders WHERE id = $1"
    values = [id]

    order_hash = SqlRunner.run(sql, values)[0]

    return PizzaOrder.new(order_hash)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    result = SqlRunner.run(sql, values)[0]
    return Customer.new(result)
  end


end
