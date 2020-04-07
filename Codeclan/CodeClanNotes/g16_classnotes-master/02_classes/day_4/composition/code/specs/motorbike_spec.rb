require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
    
require_relative('../engine.rb')
require_relative('../motorbike.rb')

class TestMotorbike < Minitest::Test
  def setup
    @engine = Engine.new()
    @motorbike = Motorbike.new("Yamaha", "FZR1000", @engine)
  end

  def test_motorbike_can_start
    assert_equal("Vrrrmmm!", @motorbike.start)
  end

end
