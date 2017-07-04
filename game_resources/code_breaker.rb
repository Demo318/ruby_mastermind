require_relative 'player.rb'
require_relative 'ai.rb'
require_relative 'ai_brain.rb'

class CodeBreaker
  attr_accessor :brain
  attr_reader :name

  def initialize(other_role, name)
    @name = name
    if other_role == "player"
      self.extend AI
      puts "And ROBOT will play the Code Breaker."
      @name = "ROBOT"
      @brain = AIBrain.new
    else
      self.extend Player
      puts "And #{@name}, you will play the Code Breaker."
      @brain = "empty"
    end
  end


end
