module Display

  def print_greeting
    puts "The game has begun; welcome to Hangman"
  end

  def print_incorrect_guess_input_error
    puts "Error: character was either not a letter or not a single character."
  end

  def print_win_message
    puts "\nYou won! The word was #{@computer.word} and you guessed it in #{@num_guesses}\n"
  end

  def print_youre_dead
    puts "\nOh no! He's been hanged!\n"
  end

  def print_hangman(hangman)
    puts hangman
  end

  def print_guessed_word(word)
    word.each do |c|
      if c.nil?
        print " _ "
      else
        print c
      end
    end
  end

  def print_remaining_words(guessed_alphabet)
    puts "\n\nThe letters you have already used are #{guessed_alphabet}\n\n"
  end

end
