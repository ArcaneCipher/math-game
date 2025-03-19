# This is the main entry point of the program.
# It requires all other files and starts the game.

require_relative "player"
require_relative "question"
require_relative "game"

# Create a new Game instance and start it.
game = Game.new
game.play
