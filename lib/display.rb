module Display

  def print_greeting
    puts "The game has begun; welcome to Hangman"
  end

  def print_incorrect_guess_input_error
    puts "Error: character was either not a letter or not a single character."
  end

  def print_win_message
    rounds = 25 - @turns
    puts "\nYou won! The word was #{@computer.word} and you guessed it in #{rounds}\n"
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

  def print_remaining_words_and_wrong_guess_count(guessed_alphabet, wrong_guess_count)
    puts "\n\nThe guesses you have already made are #{guessed_alphabet}"
    puts "Wrong guesses: #{wrong_guess_count}\n"
    wrong_guess_count = 7 - wrong_guess_count
    puts "Guesses left: #{wrong_guess_count}"
  end

  def print_does_game_continue
    puts "If you would like to end the game, type y; otherwise, type c to continue."
  end

  def print_end_of_game_statement
    "\n\nYou have chosen to end the game. Thanks for playing!\n"
  end

  def print_not_a_valid_option
    puts "\n\nThat was not a valid option. Trying again.\n"
  end

  def print_saved_file_options
    puts "\n\nYour save game files are as follows:\n"
  end

  def print_play_new_or_saved_game_prompt
    puts "\n\nType \"new\" if you would like to play a new game, "\
  " and \"saved\" if you would like to play a saved game.\n"
  end

  def print_out_of_turns
    puts "\n\nSorry, you're out of turns. Ending game.\n"
  end

  def print_whole_word_or_letter_guess
    puts "\n\nWould you like to guess a letter or the word? Type \"l\" for letter and \"w\" for word\n"
  end

  def print_make_whole_word_guess
    puts "\n\nType your guess:"
  end

  def print_no_saved_files
    puts "\nLooks like there aren't any saved files."
  end

end
