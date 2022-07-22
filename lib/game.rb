require_relative "display.rb"
require_relative "board.rb"
require_relative "computer.rb"
require_relative "player.rb"
require 'json'

class Game
  include Display

  def initialize(board=Board.new, computer=Computer.new, player=Player.new)
    @board = board
    @computer = computer
    @player = player
    play_game
  end

  def play_game
    @computer.choose_word

    25.times do |guess|
      @player.make_guess
      @computer.grade_guess(@player.guess)
      @board.print_word_progress(@computer.word_progress)

      if win?
        print_win_message
        break
      end
      if computer.wrong_guess_count > 7
        print_youre_dead
        save_game?
        break
      end

      save_game?
    end
  end

  def win?
    if @computer.word_progress.join == @computer.word
      true
    else
      false
    end
  end

  def save_game?(game1)
    puts "Would you like to save your game?\nType y for yes and n for no.\n"
    reply = gets.chomp.downcase
    if reply == "y"
      save_game
    else
      return
    end
  end

  def save_game
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')

    filename = "saved_games/#{Date.today.to_s}-game.txt"

    File.open(filename, 'w') do |file|
      file.puts self.to_json
    end
  end

  def to_json
    #turn obj into a hash that is serialized with YAML
    JSON.dump({
      :dictionary => @dictionary,
      :word_in_progress => @word_in_progress,
      :past_guesses => @past_guesses,
      :word => @word
    })
  end

  def from_json(string)
    #File.read reads a file into a string
    #turn string hash into obj
    data = JSON.load string
    @dictionary = data['dictionary']
    @word_in_progress = data['word_in_progress']
    @past_guesses = data['past_guesses']
    @word = data['word']
  end

end
