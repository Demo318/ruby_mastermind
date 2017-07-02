#needs to store super-secret code.
#needs to take new input from player/guesser
#needs to receive results from codemaster

class Board
  attr_accessor :guesses, :feedback, :secret_code
  attr_reader   :winning_feedback

  @@feedback_opts = {"wrong_num":0, "right_num":1, "right_spot":2}




  def initialize
    @guesses = Hash.new
    @feedback = Hash.new
    @secret_code = Array.new
    @winning_feedback = Array.new
    4.times { @winning_feedback << @@feedback_opts[:right_spot] }
  end

  def number_of_guesses
    puts "this function will determine how big the board is. It will get a number forom the player and start a #times iterator to make the @guesses hash that long."
  end

  def feedback_opts
    @@feedback_opts
  end


end
