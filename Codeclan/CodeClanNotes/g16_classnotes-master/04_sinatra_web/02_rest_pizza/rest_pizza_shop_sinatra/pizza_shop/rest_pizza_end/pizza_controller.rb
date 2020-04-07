require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order.rb')
also_reload('./models/*')

# INDEX
get '/pizzas' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# NEW
get '/pizzas/new' do
  @toppings = ["Margherita", "Pepperoni", "Calzone", "Italian Sausage"]
  erb(:new)
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
  erb(:show)
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
  @toppings = ["Margherita", "Pepperoni", "Calzone", "Italian Sausage"]
  id = params[:id].to_i()
  @order = PizzaOrder.find(id)
  erb(:edit)
end

# UPDATE
post '/pizzas/:id' do
  order = PizzaOrder.new(params)
  order.update()
  redirect '/pizzas'
end
