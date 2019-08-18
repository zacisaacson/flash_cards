require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_round_has_deck
    assert_equal @deck, @round.deck
  end

  def test_on_initialization_current_card_is_first_card
    expected = @card_1
    result = @round.current_card
    assert_equal expected, result
  end

  def test_take_turn_returns_turn
    guess = "whatever"
    result = @round.take_turn(guess)
    assert_instance_of Turn, result
  end

  def test_guess_matches_turn
    guess = "Whateverg"
    result = @round.take_turn(guess)
    assert_equal guess, result.guess
  end

  def test_card_returns_a_turn_using_current_card
    guess = "Whatever"
    result = @round.take_turn(guess)
    assert_equal @card_1, result.card
  end

  def test_how_many_correct
    assert_equal 1, @turn.number_correct
  end


  end


  # def test_next_card_becomes_current_card
  #   assert_equal @card_2
  #
  # end
