class Player
  include Display
  attr_reader :guess

  def initialize(guess=nil)
    @guess = guess
  end

  def make_guess
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    puts "\nMake a guess! It can be any single lowercase alphabetic letter.\n\n"
    ans = gets.chomp.downcase

    if alphabet.include?(ans) and ans.length == 1
      @guess = ans.downcase
    else
        print_incorrect_guess_input_error
        make_guess
    end
  end

end
