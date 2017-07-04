require_relative 'board.rb'
require_relative 'code_master.rb'
require_relative 'code_breaker.rb'
require_relative 'endgame.rb'

class Game
  include EndGame

  def initialize
    puts "Welcome to MASTERMIND"
    sleep(1)
    puts "What is your name?"
    @player_name = gets.chomp
    sleep(1)
    @code_master = CodeMaster.new(@player_name)
    sleep(1)
    @code_breaker = CodeBreaker.new(@code_master.mind, @player_name)
    @board = Board.new
    sleep(2)
    set_code
    sleep(2)
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
      win = victory?(@board.feedback[counter.to_s], @board.winning_feedback)
      @board.draw_board
      counter += 1
      puts "#{10 - counter} attempts reamining"
      sleep(1)
    end
    puts "#{@code_master.name} wins! #{@code_breaker.name} failed to break the code." unless win
    puts "#{@code_breaker.name} wins! He has broken #{@code_master.name}'s code." if win
  end

end
