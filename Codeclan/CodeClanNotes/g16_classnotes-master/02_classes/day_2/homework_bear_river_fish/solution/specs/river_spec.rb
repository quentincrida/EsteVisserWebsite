require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../fish.rb')
require_relative('../river.rb')

class TestRiver < Minitest::Test

  def setup
    @fish1 = Fish.new("Bob")
    @fish2 = Fish.new("Harry")
    @fish3 = Fish.new("Fred")
    @river = River.new("Amazon", [@fish1, @fish2, @fish3])
  end

  def test_can_have_name
    assert_equal("Amazon", @river.name)
  end

  def test_initial_state
    assert_equal(3, @river.number_of_fishes)
  end

  def test_can_get_fish
    fish = @river.get_fish
    assert_equal(@fish3.name, fish.name)
  end

  def test_cannot_get_fish_from_empty_river
    fish1 = @river.get_fish
    fish2 = @river.get_fish
    fish3 = @river.get_fish
    no_fish = @river.get_fish
    assert_nil(no_fish)
  end

end
