# The Game class manages the game flow, including player turns and game logic.
# It ensures that players take turns answering math questions until one loses all lives.
class Game
  def initialize
    # Create two players and set Player 1 as the starting player.
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  # Switches turns between Player 1 and Player 2.
  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  # The main game loop that continues until one player loses all lives.
  def play
    puts "Welcome to the 2-Player Math Game!"

    # Loop runs while both players have lives remaining.
    while @player1.alive? && @player2.alive?
      puts "----- NEW TURN -----"

      # Generate a new math question.
      question = Question.new

      # Prompt the current player to answer the question.
      puts "#{@current_player.name}: #{question.ask_question}"
      print "> "
      answer = gets.chomp

      # Check if the player's answer is correct.
      if question.correct_answer?(answer)
        puts "#{@current_player.name}: YES! You are correct."
      else
        puts "#{@current_player.name}: Seriously? No!"
        @current_player.lose_life
      end

      # Display the current score (lives remaining for both players).
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"

      # Switch turns unless the game has ended.
      switch_turns unless @player1.lives.zero? || @player2.lives.zero?
    end

    # Announce the winner when the game ends.
    announce_winner
  end

  # Determines and announces the winner.
  def announce_winner
    winner = @player1.alive? ? @player1 : @player2
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end
