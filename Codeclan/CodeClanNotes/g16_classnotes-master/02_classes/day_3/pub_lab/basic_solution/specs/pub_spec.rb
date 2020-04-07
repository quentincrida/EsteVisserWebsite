require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../pub")
require_relative("../drink")
require_relative("../customer")

class PubTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("beer", 2.00)
    @drink2 = Drink.new("wine", 3.00)
    @drink3 = Drink.new("gin", 4.00)
    @pub = Pub.new("The Prancing Pony", 100.00)
    @customer = Customer.new("Frodo", 10.00)
  end

  def test_pub_has_name
    assert_equal("The Prancing Pony", @pub.name())
  end

  def test_pub_has_till
    assert_equal(100.00, @pub.till())
  end

  def test_can_add_drinks
    @pub.add_drink(@drink1)
    assert_equal(1, @pub.drink_count)
  end

  def test_pub_can_serve_drink
    @pub.add_drink(@drink1)
    @pub.add_drink(@drink2)
    @pub.serve(@customer, @drink1)
    assert_equal(8.00, @customer.wallet())
    assert_equal(102.00, @pub.till())
    assert_equal(1, @pub.drink_count)
  end

  def test_pub_cannot_serve_unstocked_drink
    @pub.add_drink(@drink1)
    @pub.serve(@customer, @drink2)
    assert_equal(10.00, @customer.wallet())
    assert_equal(100.00, @pub.till())
    assert_equal(1, @pub.drink_count)
  end

  def test_pub_does_not_serve_too_many_drinks
    @pub.add_drink(@drink1)
    @pub.add_drink(@drink1)
    @pub.serve(@customer, @drink1)
    assert_equal(1, @pub.drink_count)
  end

end
