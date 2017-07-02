#how the person playing as the code_master interacts with the board. This class will be providing feedback to the Game to record to the game
require_relative 'ai.rb'
require_relative 'player.rb'


class CodeMaster
  attr_reader :role_title, :mind

  def initialize(name)
    @role_title = "Code Master"
    confirm = nil
    while confirm != "y" && confirm != "n"
      puts "Would you like to play as the Code Master? (y/n)"
      confirm = gets.chomp
    end
    if confirm == "y"
      self.extend Player
      puts "Great, #{name}, you will be the Code Master for this game."
      @mind = "player"
    else
      self.extend AI
      @mind = "ai"
    end
  end

  def check_code(guess, secret_code, feedback_opts)
    feedback = []
    guess.each_with_index do |item, ind|
      if secret_code.include?(guess[ind]) == true
        feedback << feedback_opts[:right_num] unless guess[ind] == secret_code[ind]
        if guess[ind] == secret_code[ind]
          feedback << feedback_opts[:right_spot]
        end
      else
        feedback << feedback_opts[:wrong_num]
      end
    end
    feedback.sort!
  end

end
