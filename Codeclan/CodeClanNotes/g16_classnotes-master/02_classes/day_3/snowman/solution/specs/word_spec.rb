require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../word")

class WordTest < MiniTest::Test

  def setup
    @word = Word.new("test")
  end

  def test_is_hidden
    assert_equal("****", @word.displayWord)
  end

  def test_word_includes_letter
    assert(@word.include?('t'))
  end

  def test_reveals_letters
    revealed_t = @word.displayWord(['t'])
    assert_equal("t**t", revealed_t)
  end

  def test_reveals_whole_word
    revealed_word = @word.displayWord(['t', 'e', 's'])
    assert_equal("test", revealed_word)
  end

end
