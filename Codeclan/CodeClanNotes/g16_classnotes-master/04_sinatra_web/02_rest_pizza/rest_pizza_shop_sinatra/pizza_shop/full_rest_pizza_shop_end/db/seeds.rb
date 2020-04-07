require_relative('../models/pizza_order.rb')
require_relative('../models/customer.rb')


PizzaOrder.delete_all()
Customer.delete_all()

customer1 = Customer.new(
  {
    'first_name' => 'Luke',
    'last_name' => 'Skywalker'
  }
)

customer2 = Customer.new(
  {
    'first_name' => 'Darth',
    'last_name' => 'Vader'
  }
)

customer1.save()
customer2.save()


order1 = PizzaOrder.new(
  {
    'topping' => 'Napoli',
    'quantity' => 1,
    'customer_id' => customer1.id
  }
)

order2 = PizzaOrder.new(
  {
    'topping' => 'Hawaiian',
    'quantity' => 2,
    'customer_id' => customer2.id
  }
)



order1.save()
order2.save()
