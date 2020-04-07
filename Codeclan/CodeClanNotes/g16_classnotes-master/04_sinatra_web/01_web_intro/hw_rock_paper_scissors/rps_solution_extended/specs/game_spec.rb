require ('minitest/autorun')
require ('minitest/rg')

require_relative('../models/rps.rb')

class RPSTest < MiniTest::Test

  def test_rock_wins()
    assert_equal("Player 1 won by playing Rock!", RPSGame.check_win({ player_no: 1, hand: "Rock"}, { player_no: 2, hand: "Scissors"}))
  end

  def test_scissors_wins()
    assert_equal("Player 1 won by playing Scissors!", RPSGame.check_win({ player_no: 1, hand: "Scissors"}, { player_no: 2, hand: "Paper"}))
  end

  def test_paper_wins()
      assert_equal("Player 1 won by playing Paper!", RPSGame.check_win({ player_no: 1, hand: "Paper"}, { player_no: 2, hand: "Rock"}))
  end

  def test_player2_wins_rock()
        assert_equal("Player 2 won by playing Rock!", RPSGame.check_win({ player_no: 1, hand: "Scissors"}, { player_no: 2, hand: "Rock"}))
  end

  def test_player2_wins_scissors()
      assert_equal("Player 2 won by playing Scissors!", RPSGame.check_win({ player_no: 1, hand: "Paper"}, { player_no: 2, hand: "Scissors"}))
  end

  def test_player2_wins_paper()
    assert_equal("Player 2 won by playing Paper!", RPSGame.check_win({ player_no: 1, hand: "Rock"}, { player_no: 2, hand: "Paper"}))
  end

end
