require_relative 'player.rb'
require_relative 'ai.rb'

class CodeBreaker
  attr_reader :name

  def initialize(other_role, name)
    @name = name
    if other_role == "player"
      self.extend AI
      puts "And ROBOT will play the Code Breaker."
      @name = "ROBOT"
    else
      self.extend Player
      puts "And #{@name}, you will play the Code Breaker."
    end
  end


end
