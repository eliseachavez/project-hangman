require_relative 'game.rb'
require_relative 'display.rb'

include Display

def playing
  puts "Would you like to play a new or saved game?\nType y for yes and n for no.\n"
  reply = gets.chomp.downcase
  if reply == y
    true
  else
    false
  end
end

while playing
  option = ask_new_or_saved_game?
  if option == 1
    game1 = Game.new
  elsif option == 2
    pull_up_saved_games
  else
    puts "That wasn't a valid option"
  end
end
