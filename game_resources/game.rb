require_relative 'board.rb'
require_relative 'code_master.rb'
require_relative 'code_breaker.rb'
require_relative 'endgame.rb'

class Game
  include EndGame

  def initialize
    puts "Welcome to MASTERMIND"
    puts "What is your name?"
    @player_name = gets.chomp
    @code_master = CodeMaster.new(@player_name)
    @code_breaker = CodeBreaker.new(@code_master.mind, @player_name)
    @board = Board.new
    set_code
    play
  end

  private

  def set_code
    @board.secret_code = @code_master.set_code
  end

  def play
    counter = 0
    win = false
    while counter < 10 && win == false do
      @board.guesses[counter.to_s] = @code_breaker.guess_code(@board.guesses, @board.feedback)
      @board.feedback[counter.to_s] = @code_master.check_code(@board.guesses[counter.to_s], @board.secret_code, @board.feedback_opts)
      puts "Secret #{@board.secret_code}"
      puts "Guesses #{@board.guesses}"
      puts "feedback #{@board.feedback}"
      win = victory?(@board.feedback[counter.to_s], @board.winning_feedback)
      counter += 1
    end
  end

end
