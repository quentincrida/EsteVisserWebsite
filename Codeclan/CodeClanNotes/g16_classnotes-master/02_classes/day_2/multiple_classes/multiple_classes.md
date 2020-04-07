# Multiple Classes

**Duration: 90 minutes**

## Learning Objectives

- Use multiple classes together

### Introduction

So far, we have started our journey into Object Oriented Programming by writing single classes. But in the real world, things don't exist in isolation - they interact with each other.

We're going to investigate how we can develop our programs by making our classes interact with each other. We're going to model a pet shop, which interacts with customers and pets.

> Hand out start point

Our start point contains a `customer_spec`, `pet_spec` and `Pet` class.


### Managing a person/customer.

So let's start off with the next most simple type of class which would be our customer.

So we are going to create a Customer class.

Customers will have:

- name
- cash
- pets (Array - starts off empty)

Customers should be able to

- add a pet
- add/remove cash

Let's start off by looking at the spec file for customer.

We will code this up and set up a new customer and a pet to be used later.

```ruby
# customer_spec.rb

require('minitest/autorun')
require('minitest/reporters')
require_relative('../pet.rb')
require_relative('../customer.rb')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

  def setup()
    @new_pet = Pet.new("Blue", :cat, "British Shorthair", 500)
    @customer = Customer.new("Jack Jarvis", 1000)
  end

  def test_customer_has_name()
    assert_equal("Jack Jarvis", @customer.name)
  end

  def test_customer_has_cash()
    assert_equal(1000, @customer.cash)
  end

end
```

When setting up a new customer we want them to have an empty array at the beginning. temptation is to pass in an empty array when we create the customer but this is actually bad practice. Think about it... every customer would be passed an empty array. This is a waste as it will always be the same. We will look at how we get around this shortly.

First we will create the customer class to get the tests passing.

```bash
# terminal
touch customer.rb
```

## Task

Create the customer class to get the tests passing. (Don't worry about the pets array just yet)

```ruby
# customer.rb

class Customer
  attr_reader :name, :cash

  def initialize(name, cash)
    @name = name
    @cash = cash
  end

end
```

Cool our tests now pass.

Next let's deal with the customers pets.

As we said we want the customer to have an empty pets array when they are created. To do this we simply define a new instance variable in `initialize` and set it to be an empty array.

```ruby
# customer.rb

class Customer
  attr_reader :name, :cash

  def initialize(name, cash)
    @name = name
    @cash = cash
    @pets = []
  end

end
```

Great now every time we new up a customer they will have an empty pets array.

So we probably want some way to test this.

It's not considered good practice to open up the array to the outside world. Rather, we should use methods to interact with it as appropriate - finding the length, adding a pet etc.

So we will write a test for the number of pets a customer has.

```ruby
# customer_spec.rb

def test_customer_pets_start_empty()
  assert_equal(0, @customer.pet_count())
end

```

### Task

Write the pet_count method to get the test passing.

```ruby
# customer.rb

def pet_count()
  return @pets.size()
  # or .count() or.length
end
```

Great.

Next we probably want to be able to add a pet to the customer.

So that's fine as well. We just need a method to add a pet to the customers pet array.

Again we will start off with a test. We will use the pet_count method to check that this has worked.

```ruby
# customer_spec.rb

def test_can_add_pet_to_customer()
  @customer.add_pet(@new_pet)
  assert_equal(1, @customer.pet_count())
end
```

### Task

Write the code to get the test passing.

```ruby
# customer.rb

def add_pet(pet)
  @pets.push(pet)
  # Or << or unshift()
end
```


Fantastic so now we are able to add a pet to our customer.

Now that our customer has an array of pet objects they can access the methods and properties of each pet.

Let's say, for example, that we wanted the customer to be able to return us the total cost of all their pets.

Write a test for this:

```ruby
# customer_spec.rb

def test_can_get_total_pet_cost()
  @customer.add_pet(@new_pet)
  @customer.add_pet(@new_pet)
  @customer.add_pet(@new_pet)
  assert_equal(1500, @customer.get_total_value_of_pets())
end
```

And now we will get that test passing.

```ruby
# customer.rb

def get_total_value_of_pets()
  total = 0
  for pet in @pets
    total += pet.price
  end
  return total
end
```

So now the customer can access the price of each of their pet.


## Pet Shop

Last thing to do now is to get the pet shop involved in all this.

The pet shop will be a place to store all the pets for sale.

So our pet shop will have:

- name
- pets (Array that will be passed in.)
- pets_sold
- cash

And our pet shop will be able to:

- add pet
- remove pet
- sell pet to a customer.

This time instead of having an empty array we will pass in a pre-filled array of pets to the shop. But the pets_sold will always start at 0 so we will set this in initialize.

Have a look at the pet_shop_spec.

```ruby
# pet_shop_spec.rb

require('minitest/autorun')
require('minitest/reporters')
require_relative('../pet')
require_relative('../pet_shop')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class PetShopTest < MiniTest::Test

  def setup()

    @pet1 = Pet.new("Sir Percy", :cat, "British Shorthair", 500)
    @pet2 = Pet.new("Sir Percy", :cat, "British Shorthair", 500)

    @pets = [@pet1, @pet2]

    @pet_shop = PetShop.new("Camelot of Pets", @pets, 1000 )

  end

  def test_pet_shop_has_name()
    assert_equal("Camelot of Pets", @pet_shop.name)
  end

  # def test_pet_shop_cash()
  #   assert_equal(1000, @pet_shop.total_cash)
  # end
  #
  # def test_pet_shop_pets_sold()
  #   assert_equal(0, @pet_shop.pets_sold)
  # end
  #
  # def test_pet_shop_stock_count()
  #   assert_equal(2, @pet_shop.stock_count())
  # end

  # def test_increase_pets_sold()
  #   @pet_shop.increase_pets_sold()
  #   assert_equal(1, @pet_shop.pets_sold)
  # end
  #
  # def test_can_increase_total_cash()
  #   @pet_shop.increase_total_cash(500)
  #   assert_equal(1500, @pet_shop.total_cash)
  # end
  #
  # def test_can_add_pet_to_stock()
  #   @pet_shop.add_pet(@new_pet)a
  #   assert_equal(3, @pet_shop.stock_count())
  # end
  #
  # def test_can_remove_pet_from_stock()
  #   @pet_shop.remove_pet(@pet1)
  #   assert_equal(1, @pet_shop.stock_count())
  # end

end
```

### Task

Uncomment one test at a time and code the pet shop class to get them all passing.

(Remember that PetShop will have a pets_sold property that starts at 0)

```ruby
# pet_shop.rb

class PetShop

  attr_reader :name, :total_cash, :pets_sold

  def initialize(name, pets, total_cash)
    @name = name
    @pets = pets
    @total_cash = total_cash
    @pets_sold = 0
  end

  def stock_count()
    return @pets.size()
  end

  def increase_pets_sold()
    @pets_sold += 1
  end

  def add_pet(pet)
    @pets.push(pet)
  end

  def remove_pet(pet)
    @pets.delete(pet)
  end

  def increase_total_cash(amount)
    @total_cash += amount
  end
end
```

### Selling a pet to a customer.

Lastly we will sell a pet to our customer.

So where will this happen?

We can either do this 2 ways. We can have a method in customer to buy pet or have a method in pet_shop to sell to customer.

We are going to write a buy_pet method in the pet shop class.

Why?

Easy....Because it is the pet shop is the one selling the pet. So they should trigger the process. All the customer needs to know is the pet they want to buy.
We won't worry about adjusting cash just now.

So we will test this in the `pet_shop_spec` file.


To start with we will write the test for this.

This can be an integration test. So when a customer buys a pet we want:

Customers pet count to go up by 1
Shops stock to go down
Shops pets sold to go up.
Shops total_cash to increase by price of pet.

To do this we will pass in the name of the pet and use the pet shop to find that pet.

Let's start by coding the `find_pet_by_name` method in shop and finding the pet that the customer wants to buy.

Start with a test in `pet_shop_spec`

```ruby
# pet_shop_spec.rb

def test_can_find_by_name()
  pet = @pet_shop.find_pet_by_name("Sir Percy")
  assert_equal("Sir Percy", pet.name)
end

```

```ruby
# pet_shop.rb

def find_pet_by_name(name)
  for pet in @pets
    if pet.name == name
      return pet
    end
  end
  return nil
end

```

Now we will write the test to buy the pet.

In this test we will need to set up a customer to buy the pet.

We will need to require in the customer file as we want to create a new instance.


```ruby
# pet_shop_spec.rb

require_relative('../customer')
```

```ruby
# pet_shop_spec.rb

def test_can_sell_pet_to_customer()
  customer = Customer.new("Jack Jarvis", 1000)
end

```

Next pass the name of the pet and the customer to a `sell_pet_to_customer` method in pet shop.

```ruby
# pet_shop_spec.rb

def test_can_sell_pet_to_customer()
  customer = Customer.new("Jack Jarvis", 1000)
  @pet_shop.sell_pet_to_customer("Sir Percy", customer)
end
```

And lastly set up our asserts

```ruby
# pet_shop_spec.rb

def test_can_sell_pet_to_customer()
  customer = Customer.new("Jack Jarvis", 1000)
  @pet_shop.sell_pet_to_customer("Sir Percy", customer)
  assert_equal(1, customer.pet_count())
  assert_equal(1, @pet_shop.stock_count())
  assert_equal(1, @pet_shop.pets_sold)
  assert_equal(1500, @pet_shop.total_cash)
end
```


And now we can code the `sell_pet_to_customer` method in the pet shop.

The first thing this should do is find the pet to sell. (We won't worry about `nil` pets just yet)

```ruby
# pet_shop.rb

def sell_pet_to_customer(name, customer)
  pet = find_pet_by_name(name)
end
```

Now that we have that we will add the pet to the customer.

Note that this is modifying the customers properties. We don't want the pet shop to directly manipulate the customers properties. (That would be bad!)

Instead we will have the shop call a method in the customer to trigger this update.

Thankfully we have an 'add_pet' method available in the customer.

We can do this as we passed the customer into the `sell_pet_to_customer` method. We have access to all the things customers can do.


```ruby
# pet_shop.rb

def sell_pet_to_customer(name, customer)
  pet = find_pet_by_name(name)
  customer.add_pet(pet)
end
```

Next is to remove that pet from the stock

```ruby
# pet_shop.rb

def sell_pet_to_customer(name, customer)
  pet = find_pet_by_name(name)
  customer.add_pet(pet)
  remove_pet(pet)
end
```

And finally increase the pets sold and the total cash.

```ruby
# pet_shop.rb

def sell_pet_to_customer(name, customer)
  pet = find_pet_by_name(name)
  customer.add_pet(pet)
  remove_pet(pet)
  increase_pets_sold()
  increase_total_cash(pet.price)
end
```

### Conclusion

One way we can make objects interact is to add an array as an instance variable. But it doesn't have to be an array! An instance variable could be a single object, such as customers only having a single `Pet` property, for example.

Because we're passing a full pet_shop object in, we can also call methods on those objects.


For example, a car class might have an `engine` property. and the start the car, we might do `@engine.start`. This is a process called _composition_, and we'll look at it in more detail later on in the course.
