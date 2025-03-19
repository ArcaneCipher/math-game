# The Player class represents a participant in the game.
# Each player starts with 3 lives and loses a life when they answer incorrectly.
class Player
  attr_reader :name, :lives

  # Initializes a player with a given name and sets lives to 3.
  def initialize(name)
    @name = name
    @lives = 3
  end

  # Reduces the player's life count by 1 when they answer incorrectly.
  def lose_life
    @lives -= 1
  end

  # Checks if the player still has lives remaining.
  # Returns true if the player has more than 0 lives, otherwise false.
  def alive?
    @lives > 0
  end
end
