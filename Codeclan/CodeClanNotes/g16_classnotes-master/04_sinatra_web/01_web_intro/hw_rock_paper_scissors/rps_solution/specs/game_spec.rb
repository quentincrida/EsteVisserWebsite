require ('minitest/autorun')
require ('minitest/rg')

require_relative('../models/rps.rb')

class RPSTest < MiniTest::Test

  def test_rock_wins()
    assert_equal("Player 1 wins with rock!", RPSGame.check_win("Rock", "Scissors"))
  end

  def test_scissors_wins()
    assert_equal("Player 1 wins with scissors!", RPSGame.check_win("Scissors", "Paper"))
  end

  def test_paper_wins()
    assert_equal("Player 1 wins with paper!", RPSGame.check_win("Paper", "Rock"))
  end

  def test_player2_wins_rock()
      assert_equal("Player 2 wins with rock!", RPSGame.check_win("Scissors", "Rock"))
  end

  def test_player2_wins_scissors()
      assert_equal("Player 2 wins with scissors!", RPSGame.check_win("Paper", "Scissors"))
  end

  def test_player2_wins_paper()
      assert_equal("Player 2 wins with paper!", RPSGame.check_win("Rock", "Paper"))
  end

end
