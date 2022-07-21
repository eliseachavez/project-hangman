module Display
  def ask_new_or_saved_game?
    puts "Would you like to play a new game or a saved one?"
  end

  def print_greeting
    puts "The game has begun; welcome to Hangman"
  end

  def ask_to_continue
    puts "Would you like to play another game?\nType y for yes and n for no.\n"
    reply = gets.chomp.downcase
    if reply == y
      true
    else
      false
    end
  end
end
