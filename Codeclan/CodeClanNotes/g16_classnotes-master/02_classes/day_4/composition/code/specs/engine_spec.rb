require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../engine.rb')


class TestEngine < Minitest::Test
  def setup
    @engine = Engine.new()
  end

  def test_engine_can_start
    assert_equal("Vrrrmmm!", @engine.start)
  end

end
