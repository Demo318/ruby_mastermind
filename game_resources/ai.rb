


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
    sleep(1)
    if prev_feedback_hash.length > 0
      return educated_guess(prev_guesses_hash, prev_feedback_hash)
    else
      return first_turn_guess()
    end
  end

  def first_turn_guess()
    guess_code = Array.new
    while guess_code.length < 4
      num = rand(1..6)
      guess_code << num if guess_code.include?(num) == false
    end
    guess_code
  end

  def educated_guess(prev_guesses_hash, prev_feedback_hash)
    candidate_digits = (1..6).to_a    
    prev_feedback_hash.each_with_index do |feedback, turn_index|
      feedback.each_with_index do |item, idx|
        if item == "X"
          candidate_digits = candidate_digits.reject { |i| i == prev_guesses_hash[turn_index][idx] }
        end
      end
    end
    guess_code = build_guess(prev_guesses_hash, prev_feedback_hash, candidate_digits)
    while prev_guesses_hash.include?(guess_code)
      guess_code = build_guess(prev_guesses_hash, prev_feedback_hash, candidate_digits)
    end
    guess_code
  end

  def build_guess(prev_guesses_hash, prev_feedback_hash, candidate_digits)
    guess_code = Array.new    
    while guess_code.length < 4
      if prev_feedback_hash.length > 0
        last_turn = (prev_feedback_hash.length-1)
        prev_feedback_hash[last_turn].each_with_index do |item, idx|
          if item == "!"
            guess_code << prev_guesses_hash[last_turn][idx]
          else
            guess_code << candidate_digits.sample
          end
        end
      else
        num = candidate_digits.sample
        guess_code << num if guess_code.include?(num) == false
      end
    end
    guess_code
  end

end
