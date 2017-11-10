#needs to store super-secret code.
#needs to take new input from player/guesser
#needs to receive results from codemaster

class Board
  attr_accessor :guesses, :feedback, :secret_code
  attr_reader   :winning_feedback

  @@feedback_opts = {"wrong_num":0, "right_num":1, "right_spot":2}

  def initialize
    @guesses = Array.new
    @feedback = Array.new
    @secret_code = Array.new
    @winning_feedback = Array.new
    4.times { @winning_feedback << @@feedback_opts[:right_spot] }
  end

  def feedback_opts
    @@feedback_opts
  end

  def draw_feedback(feedback_arr)
    feedback_arr.each_with_index do |item, ind|
      case item
      when 0 then feedback_arr[ind] = "X"
      when 1 then feedback_arr[ind] = "#"
      when 2 then feedback_arr[ind] = "!"
      end
    end
    feedback_arr = feedback_arr.join
  end

  def draw_answer(answer_arr)
    answer_arr.join(" ")
  end

  def draw_blank_row(divider)
    puts divider
    puts "|         |      |"
  end

  def draw_board
    real_rows = @guesses.length

    divider = "------------------"
    num_blank_rows = 10 - real_rows
    num_blank_rows.times { draw_blank_row(divider) }

    counter = real_rows - 1
    real_rows.times do
      guess_arr = @guesses[counter]
      feedback_arr = @feedback[counter]
      puts divider
      puts "| #{draw_answer(guess_arr)} | #{draw_feedback(feedback_arr)} |"
      counter -= 1
    end
    puts divider
    draw_key if real_rows < 2
  end

  def draw_key
    puts "  Right Spot: #{draw_feedback([2])}"
    puts "Right Number: #{draw_feedback([1])}"
    puts "Wrong Number: #{draw_feedback([0])}"
  end

end
