require_relative 'game.rb'
require_relative 'display.rb'
require 'time'
require 'date'

include Display

def playing
  puts "Would you like to play a game?\nType y for yes and n for no.\n"
  reply = gets.chomp.downcase
  if reply == "y"
    true
  else
    false
  end
end

def save_game?(game1)
  puts "Would you like to save your game?\nType y for yes and n for no.\n"
  reply = gets.chomp.downcase
  if reply == "y"
    save_game(game1)
  else
    return
  end
end

def pull_up_saved_games
 puts "Your save game files are as follows:\n"
 file_list =  Dir.glob('saved_games/*')
 file_list.each_with_index do |file, idx|
  idx += 1
   puts "#{idx.to_s} #{file}"
 end
 puts "\nType the number for the file you would like to load:"
 ans = gets.chomp
 ans = ans.to_i
 load_game(ans, file_list) unless ans > file_list.length
end

def load_game(ans, file_list)
  ans -= 1
  data = File.open(file_list[ans], 'r'){ |file| file.read}
end

def new_or_saved_game?
  puts "\n\nType \"new\" if you would like to play a new game, "\
  " and \"saved\" if you would like to play a saved game.\n\n"
  reply = gets.chomp
end

def prompt
  while playing
    option = new_or_saved_game?
    if option == "new"
      game1 = Game.new
    elsif option == "saved"
      game1 = Game.new
      game1.from_json(pull_up_saved_games)
    else
      puts "That wasn\'t a valid option".
      prompt
    end
    game1.save_game
  end
end

prompt
