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

def save_game(game1)
  Dir.mkdir('saved_games') unless Dir.exist?('saved_games')

  time = Time.now.to_s
  date = Date.today.to_s

  filename = "saved_games/#{time}-#{date}-game.txt"

  File.open(filename, 'w') do |file|
    puts "hi"
  end
end

def pull_up_saved_games

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
      pull_up_saved_games
    else
      puts "That wasn\'t a valid option".
      prompt
    end
    save_game?(game1)
  end
end

prompt
