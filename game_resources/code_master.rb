#how the person playing as the code_master interacts with the board. This class will be providing feedback to the Game to record to the game
require_relative 'ai.rb'
require_relative 'player.rb'


class CodeMaster
  attr_reader :role_title, :mind, :name

  def initialize(name)
    @role_title = "Code Master"
    @name = name
    confirm = nil
    while confirm != "y" && confirm != "n"
      puts "Would you like to play as the Code Master? (y/n)"
      confirm = gets.chomp
    end
    sleep(1)
    if confirm == "y"
      self.extend Player
      puts "Great, #{@name}, you will play the Code Master for this game."
      @mind = "player"
    else
      @name = "ROBOT"
      puts "Great, #{@name} will play the Code Master for this game."
      self.extend AI
      @mind = "ai"
    end
  end

  def check_code(guess, secret_code)
    feedback = []
    guess.each_with_index do |item, ind|
      if secret_code.include?(item)
        if item == secret_code[ind]
          feedback << :right_spot
        else
          feedback << :right_num
        end
      else
        feedback << :wrong_num
      end
    end
    # feedback.sort!
    feedback
  end

end
