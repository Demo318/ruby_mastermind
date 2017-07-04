#require_relative 'code_master.rb'
#require_relative 'code_breaker.rb'

module AI

  def set_code
    secret_code = Array.new
    while secret_code.length < 4
      num = rand(1..6)
      secret_code << num if secret_code.include?(num) == false
    end
    secret_code
  end

  def guess_code(prev_guesses_hash, prev_feedback_hash) #returns array of four digits
    guess_code = Array.new
    while guess_code.length < 4
      num = rand(1..6)
      guess_code << num if guess_code.include?(num) == false
    end
    sleep(1)
    guess_code
  end

end
