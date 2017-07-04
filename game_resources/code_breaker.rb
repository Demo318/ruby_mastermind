require_relative 'player.rb'
require_relative 'ai.rb'

class CodeBreaker
  attr_reader :name

  def initialize(other_role, name)
    @name = name
    if other_role == "player"
      self.extend AI
      puts "Great, ROBOT, you will be the Code Breaker for this game."
      @name = "ROBOT"
    else
      self.extend Player
      puts "Great, #{@name}, you will be the Code Breaker for this game."
    end
  end


end
