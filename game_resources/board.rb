#needs to store super-secret code.
#needs to take new input from player/guesser
#needs to receive results from codemaster

class Board
  attr_accessor :guesses, :feedback, :secret_code
  attr_reader   :winning_feedback

  def initialize
    @guesses = Array.new
    @feedback = Array.new
    @secret_code = Array.new
    @winning_feedback = Array.new
    4.times { @winning_feedback << :right_spot }
  end

  def draw_feedback(feedback_arr)
    feedback_arr.each_with_index do |item, ind|
      case item
      when :wrong_num then feedback_arr[ind] = "X"
      when :right_num then feedback_arr[ind] = "#"
      when :right_spot then feedback_arr[ind] = "!"
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
    puts "  Right Spot: #{draw_feedback([:right_spot])}"
    puts "Right Number: #{draw_feedback([:right_num])}"
    puts "Wrong Number: #{draw_feedback([:wrong_num])}"
  end

end
