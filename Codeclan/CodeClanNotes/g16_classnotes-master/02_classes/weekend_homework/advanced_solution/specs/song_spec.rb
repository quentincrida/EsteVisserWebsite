require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class GuestTest < Minitest::Test

  def setup
    @song = Song.new("Livin La Vida Loca", "Ricky Martin")
  end

  def test_song_has_title
    assert_equal("Livin La Vida Loca", @song.title)
  end

  def test_song_has_author
    assert_equal("Ricky Martin", @song.author)
  end

end
