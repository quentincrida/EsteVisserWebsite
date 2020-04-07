require_relative('../models/pizza_order.rb')
require_relative('../models/customer.rb')

# INDEX
get '/pizzas' do
  @orders = PizzaOrder.all()
  erb(:"pizzas/index")
end

# NEW
get '/pizzas/new' do
  @customers = Customer.all()
  @toppings = ["Napoli", "Hawaiian", "Pepperoni", "Calzone"]
  erb(:"pizzas/new")
end

# CREATE
post '/pizzas' do
  order_hash = params
  order = PizzaOrder.new(order_hash)
  order.save()
  redirect "/pizzas"
end

# SHOW
get '/pizzas/:id' do
  id = params[:id].to_i()
  @order = PizzaOrder.find(id)
  erb(:"pizzas/show")
end

# DELETE
post '/pizzas/:id/delete' do
  id = params[:id].to_i()
  order = PizzaOrder.find(id)
  order.delete()
  redirect '/pizzas'
end

# EDIT
get '/pizzas/:id/edit' do
  id = params[:id].to_i()
  @order = PizzaOrder.find(id)
  @customers = Customer.all()
  @toppings = ["Napoli", "Hawaiian", "Pepperoni", "Calzone"]
  erb(:"pizzas/edit")
end

#UPDATE
post '/pizzas/:id' do
  order = PizzaOrder.new(params)
  order.update()
  redirect '/pizzas'
end
