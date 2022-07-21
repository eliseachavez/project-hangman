require_relative "display.rb"
require 'yaml'

class Game
  include Display

  def initialize(dictionary=[], word_in_progress=[], past_guesses=[], word=nil)
    @dictionary = dictionary
    @word_in_progress = word_in_progress
    @past_guesses = past_guesses
    @word = word
    play_game
  end

  def play_game
    @word = choose_word
    #tell them the progress of their word
    #tell them what they've already guessed
    #tell them how many guesses left
  end

  def choose_word
    if @word == nil
      unfiltered_dictionary = File.open("google-10000-english-no-swears.txt", 'r').readlines.each do |line|
        @dictionary.push(line.chomp) if line.chomp.length > 5
      end
      rand_num = generate_rand_num(@dictionary.length)
      @dictionary[rand_num]
    else
      @word
    end
  end

  def generate_rand_num(max_size)
    rand_num = rand(max_size)
  end

  def to_yaml
    #turn obj into a hash that is serialized with YAML
    YAML.dump({
      :dictionary => @dictionary,
      :word_in_progress => @word_in_progress,
      :past_guesses => @past_guesses,
      :word => @word
    })
  end

  def from_yaml(string)
    #File.read reads a file into a string
    #turn string hash into obj
    data = YAML.load string
    @dictionary = data[:dictionary]
    @word_in_progress = data[:word_in_progress]
    @past_guesses = data[:past_guesses]
    @word = data[:word]
  end

  def save_game(game1)
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')

    filename = "saved_games/#{Date.today.to_s}-game.txt"

    File.open(filename, 'w') do |file|
      file.puts game1.to_yaml
    end
  end

end
