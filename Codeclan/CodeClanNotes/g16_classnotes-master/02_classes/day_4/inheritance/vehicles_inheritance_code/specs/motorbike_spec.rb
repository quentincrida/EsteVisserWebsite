require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../motorbike.rb')

class TestMotorbike < Minitest::Test
  def setup
    @motorbike = Motorbike.new()
  end

  def test_motorbike_can_start_engine
    assert_equal("Vrrmmm (I'm a motorbike), HELL YEAH!", @motorbike.start_engine)
  end
end
