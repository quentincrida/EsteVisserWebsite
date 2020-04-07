require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../fish.rb')

class TestFish < Minitest::Test

  def test_fish_has_name
    fish = Fish.new("Bob")
    assert_equal("Bob", fish.name)
  end

end
