require 'minitest/autorun'
require './black_jack'

class BlackJackTest < MiniTest::Test

  def test_it_creates_a_card
    card = Card.new("Hearts", "3")
    assert_equal "Hearts", card.suit
    assert_equal "3", card.value
  end

  def test_it_creates_a_deck
    deck = Deck.new
    assert_equal 52, deck.cards.count 
  end

  def test_it_creates_a_game
    game = Game.new
    assert_equal 52, game.deck.cards.count 
    assert_equal Player, game.player.class
  end

  def test_it_deals_two_cards
    game = Game.new
    game.deal

    assert_equal game.player.hand.count, 2
    assert_equal game.deck.cards.count, 50
  end

  def test_it_can_hit
    game = Game.new
    game.deal
    game.hit

    assert_equal game.player.hand.count, 3
  end

  def test_can_get_player_score
    player = Player.new
    player.hand << Card.new("Hearts", "4")
    player.hand << Card.new("Diamnods", "A")

    assert_equal 15, player.score
  end

end
