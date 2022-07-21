module Display
  def ask_new_or_saved_game?
    puts "\nWould you like to play a new game or a saved one?"\
    "\nType 1 for a new game and type 2 to see a list of saved games you can play.\n"
    gets.chomp.to_i
  end

  def print_greeting
    puts "The game has begun; welcome to Hangman"
  end

end
