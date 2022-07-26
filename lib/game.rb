require_relative "display.rb"
require_relative "board.rb"
require_relative "computer.rb"
require_relative "player.rb"
require 'json'
require 'time'
require 'date'

class Game
  include Display

  attr_accessor :turns
  def initialize(board=Board.new, computer=Computer.new, player=Player.new, turns=25, playing=true)
    @board = board
    @computer = computer
    @player = player
    @turns = turns
    @playing = playing
    play_game
  end

  def play_game
    @computer.choose_word
    new_or_saved_game?


    while @playing do
      if @turns == 25
        @board.print_word_progress(@computer.word_progress, @computer.wrong_guess_count, @computer.guessed_alphabet)
      end

      @turns -= 1
      @player.make_guess
      @computer.grade_guess(@player.guess)
      @board.print_word_progress(@computer.word_progress, @computer.wrong_guess_count, @computer.guessed_alphabet)

      game_continues?
    end
  end

  def new_or_saved_game?
    print_play_new_or_saved_game_prompt
    ans = gets.chomp

    if ans == "saved"
      pull_up_saved_games
    elsif ans != "new"
      print_not_a_valid_option
      new_or_saved_game?
    end
  end

  def pull_up_saved_games
    print_saved_file_options

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
    from_json(data)
  end

  def win?
    if @computer.word_progress.join == @computer.word
      true
    else
      false
    end
  end

  def save_game?
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

    filename = "saved_games/#{DateTime.now.strftime("%d%-m%-Y--%H:%M")}-game.txt"

    File.open(filename, 'w') do |file|
      file.puts self.to_json
    end
    @turns = 0
  end

  def to_json
    #turn obj into a hash that is serialized with YAML
    JSON.dump({
      :word => @computer.word,
      :guessed_alphabet => @computer.guessed_alphabet,
      :word_progress => @computer.word_progress,
      :wrong_guess_count => @computer.wrong_guess_count,
      :turns => @turns
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
    @turns = data['turns']
  end

  def game_continues?
    # have we won?
    if win?
      print_win_message
      @playing = false
    end

    # have we exceeded number of wrong guesses?
    if @computer.wrong_guess_count >= 7
      print_youre_dead
      @playing = false
    end

    # check if we have gone past 25 rounds
    if @turns == 0
      print_out_of_turns
      @playing = false
    end

    # now ask if player would like to continue game or not (then prompt to save)
    print_does_game_continue
    ans = gets.chomp

    if @playing
      if ans == "y"
        save_game?
        print_end_of_game_statement
        @playing = false
      elsif ans == "c"
        save_game?
      else
        print_not_a_valid_option
        game_continues?
      end
    end

  end

end
