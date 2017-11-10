


module AI

  def set_code
    secret_code = Array.new
    while secret_code.length < 4
      num = rand(1..6)
      secret_code << num if secret_code.include?(num) == false
    end
    secret_code
  end

  def guess_code(prev_guesses_hash, prev_feedback_hash, ai_brain) #returns array of four digits
    candidate_digits = (1..6).to_a
    if prev_feedback_hash.length > 0
      # why quoted?
      prev_feedback_hash["0"].each_with_index do |item, idx|
        if item == "X"
          candidate_digits = candidate_digits.reject { |i| i == prev_guesses_hash["0"][idx] }
        end
      end
    end
    puts candidate_digits
    guess_code = Array.new
    while guess_code.length < 4
      if prev_feedback_hash.length > 0
        last_turn = (prev_feedback_hash.length-1).to_s
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
    sleep(1)
    guess_code
  end

end
