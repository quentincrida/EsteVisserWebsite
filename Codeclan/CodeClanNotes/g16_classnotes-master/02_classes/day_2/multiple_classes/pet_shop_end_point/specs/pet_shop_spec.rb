require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pet')
require_relative('../pet_shop')
require_relative('../customer')

class PetShopTest < MiniTest::Test

  def setup()

    @pet1 = Pet.new("Sir Percy", :cat, "British Shorthair", 500)
    @pet2 = Pet.new("King Arthur", :dog, "Husky", 900)

    @pets = [@pet1, @pet2]

    @pet_shop = PetShop.new("Camelot of Pets", @pets, 1000 )

  end

  def test_pet_shop_has_name()
    assert_equal("Camelot of Pets", @pet_shop.name)
  end

  def test_pet_shop_cash()
    assert_equal(1000, @pet_shop.total_cash)
  end

  def test_pet_shop_pets_sold()
    assert_equal(0, @pet_shop.pets_sold)
  end

  def test_pet_shop_stock_count()
    assert_equal(2, @pet_shop.stock_count())
  end

  def test_can_add_pet_to_stock()
    new_pet = Pet.new("Bors The Younger", :cat, "Cornish Rex", 700)
    @pet_shop.add_pet(new_pet)
    assert_equal(3, @pet_shop.stock_count())
  end

  def test_can_remove_pet_from_stock()
    @pet_shop.remove_pet(@pet1)
    assert_equal(1, @pet_shop.stock_count())
  end

  def test_increase_pets_sold()
    @pet_shop.increase_pets_sold()
    assert_equal(1, @pet_shop.pets_sold)
  end

  def test_can_increase_total_cash()
    @pet_shop.increase_total_cash(500)
    assert_equal(1500, @pet_shop.total_cash)
  end

  def test_can_find_by_name()
    pet = @pet_shop.find_pet_by_name("Sir Percy")
    assert_equal("Sir Percy", pet.name)
  end

  def test_customer_can_buy_pet()
    customer = Customer.new("Jack Jarvis", 1000)
    @pet_shop.sell_pet_to_customer("Sir Percy", customer)
    assert_equal(1, customer.pet_count())
    assert_equal(1, @pet_shop.stock_count())
    assert_equal(1, @pet_shop.pets_sold)
  end

end
