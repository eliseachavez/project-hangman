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
    turns = 25
    turns.times do |guess|
      @player.make_guess
      @computer.grade_guess(@player.guess)
      @board.print_word_progress(@computer.word_progress, @computer.wrong_guess_count, @computer.guessed_alphabet)

      if win?
        print_win_message
        break
      end
      if @computer.wrong_guess_count > 7
        print_youre_dead
        turns = save_game?(turns)
        break
      end

      turns = save_game?(turns)
    end
  end

  def win?
    if @computer.word_progress.join == @computer.word
      true
    else
      false
    end
  end

  def save_game?(turns)
    puts "Would you like to save your game?\nType y for yes and n for no.\n"
    reply = gets.chomp.downcase
    if reply == "y"
      save_game(turns)
    else
      return
    end
  end

  def save_game(turns)
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')

    filename = "saved_games/#{Date.today.to_s}-game.txt"

    File.open(filename, 'w') do |file|
      file.puts self.to_json
    end

    turns = 0
  end

  def to_json
    #turn obj into a hash that is serialized with YAML
    JSON.dump({
      :word => @computer.word,
      :guessed_alphabet => @computer.guessed_alphabet,
      :word_progress => @computer.word_progress,
      :wrong_guess_count => @computer.wrong_guess_count
    })
  end

  def from_json(string)
    #File.read reads a file into a string
    #turn string hash into obj
    data = JSON.load string
    @computer.word = data['word']
    @computer.guessed_alphabet = data['guessed_alphabet']
    @computer.word_progress = data['word_progress']
    @computer.wrong_guess_count = data['wrong_guess_count']
  end

end
