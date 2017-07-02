require_relative 'player.rb'
require_relative 'ai.rb'

class CodeBreaker

  def initialize(other_role, name)
    if other_role == "player"
      self.extend AI
      puts "Great, ROBOT, you will be the Code Breaker for this game."
    else
      self.extend Player
      puts "Great, #{name}, you will be the Code Breaker for this game."
    end
  end


end
