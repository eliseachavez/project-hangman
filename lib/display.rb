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

  def print_does_game_continue
    puts "If you would like to end the game, type y; otherwise, type c to continue."
  end

  def print_end_of_game_statement
    "\n\nYou have chosen to end the game. Thanks for playing!\n\n"
  end

  def print_not_a_valid_option
    puts "\n\nThat was not a valid option. Trying again.\n\n"
  end

  def print_saved_file_options
    puts "\n\nYour save game files are as follows:\n"
  end

  def print_play_new_or_saved_game_prompt
    puts "\n\nType \"new\" if you would like to play a new game, "\
  " and \"saved\" if you would like to play a saved game.\n\n"
  end

end
