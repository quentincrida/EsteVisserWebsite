require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../drink")

class DrinkTest < MiniTest::Test

  def setup
    @drink = Drink.new("wine", 4.00)
  end

  def test_drink_has_name
    assert_equal("wine", @drink.name())
  end

  def test_drink_has_price
    assert_equal(4.0, @drink.price())
  end

end
