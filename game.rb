class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def play
    puts "Welcome to the 2-Player Math Game!"
    while @player1.alive? && @player2.alive?
      puts "----- NEW TURN -----"
      question = Question.new

      puts "#{@current_player.name}: #{question.ask_question}"
      print "> "
      answer = gets.chomp

      if question.correct_answer?(answer)
        puts "#{@current_player.name}: Yes! You are correct."
      else
        puts "#{@current_player.name}: Seriously? No!"
        @current_player.lose_life
      end

      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"

      switch_turns unless @player1.lives.zero? || @player2.lives.zero?
    end

    announce_winner
  end

  def announce_winner
    winner = @player1.alive? ? @player1 : @player2
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good Bye!"
  end
end
