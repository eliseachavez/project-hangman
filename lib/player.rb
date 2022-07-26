class Player
  include Display
  attr_reader :guess

  def initialize(guess=nil)
    @guess = guess
  end

  def make_guess
    letter_guess = whole_word_or_letter_guess?

    if letter_guess
      alphabet = "abcdefghijklmnopqrstuvwxyz"
      puts "\nMake a guess! It can be any single lowercase alphabetic letter.\n\n"
      ans = gets.chomp.downcase

      if alphabet.include?(ans) and ans.length == 1
        @guess = ans
      else
          print_incorrect_guess_input_error
          make_guess
      end
    else # whole word guess!
      print_make_whole_word_guess
      @guess = ans = gets.chomp.downcase

    end
  end

  def whole_word_or_letter_guess?
    print_whole_word_or_letter_guess
    ans = gets.chomp

    if ans == "l"
      true
    elsif ans == "w"
      false
    else
      print_not_a_valid_option
      whole_word_or_letter_guess?
    end
  end

end
