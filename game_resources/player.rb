module Player

  def set_code
    puts "It's time to set a secret code for your oponent to guess."
    move_on = false
    until move_on == true do
      digits = grab_digits
      verified = confirm_digits(digits) if verify_digits(digits)
      move_on = true if verified
    end
    digits
  end

  def guess_code(prev_guesses_hash, prev_feedback_hash) #returns array of four digits
    puts "It's time to guess the secret code that your oponent has set."
    move_on = false
    until move_on == true do
      digits = grab_digits
      verified = confirm_digits(digits) if verify_digits(digits) && not_prev_digits(digits, prev_guesses_hash)
      move_on = true if verified
    end
    digits
  end

  def not_prev_digits(current, pre_hash)
    not_prev = true
    pre_hash.each do |key, item|
      not_prev = false if current == item
    end
    puts "You've already entered that combination." if not_prev == false
    not_prev
  end

  def grab_digits
    puts "Please enter a combination of four digits, 1-6."
    entry = gets.chomp
    entry = entry.gsub(/(\D|[^1-6])/, "").match(/[1-6]{4}/).to_s.split("")
    entry.each_with_index do |num, ind|
      entry[ind] = num.to_i
    end
    entry
  end

  def confirm_digits(digits)
    confirmed = false
    decision = nil
    while decision != "y" && decision != "n" do
      puts "You've entered the code #{digits.join} is that correct? (y/n)"
      decision = gets.chomp
    end
    confirmed = true if decision == "y"
    confirmed
  end

  def verify_digits(digits)
    good = true
    if digits.length < 4
      good = false
      puts "You did not enter enough digits."
    end
    digits.each do |num|
      if digits.count(num) > 1
      good = false
      puts "You entered the same digit more than once."
      break
      end
    end
    good
  end


end
