class Game
  attr_accessor :deck, :player

  def initialize
    @deck = Deck.new
    @player = Player.new
  end
  
  def start
    get_name
    play_game
  end
  
  def get_name
    puts "What is your name?"
    player.name = gets
  end

  def play_game
    deal
  end

  def deal
    2.times do
      player.hand << deck.cards.pop
    end
    say_cards
  end

  def hit
    player.hand << deck.cards.pop
    say_cards
  end

  def say_cards
    player.hand.each do |card|
      puts "#{card.value} of #{card.suit}"
    end
  end
end

class Player
  attr_accessor :hand, :name

  def initialize
    @hand ||= []
  end

  def score
    @hand.map(&:score).reduce(:+)
  end

end

class Deck
  attr_accessor :cards

  SUITS = ["Hearts", "Clubs", "Spades", "Diamonds"]
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(suit, value)
      end
    end
    @cards.shuffle!
  end
end


class Card
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  attr_accessor :value, :suit

  def initialize(suit, value)
    @value = value
    @suit = suit
  end

  def score
    if %w(J Q K).include?(value)
      10
    elsif value == "A"
      11
    else
    VALUES.index(value) + 2
    end
  end
end
