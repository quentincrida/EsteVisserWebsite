require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../car.rb')

class TestCar < Minitest::Test
  def setup
    @car = Car.new("Ferrari")
  end

  def test_car_can_start_engine
    assert_equal("Vrrmmm", @car.start_engine)
  end

  def test_car_has_model
    assert_equal("Ferrari", @car.model)
  end
end
