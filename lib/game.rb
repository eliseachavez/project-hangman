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
    choose_word
    #tell them the progress of their word
    #tell them what they've already guessed
    #tell them how many guesses left
  end

  def choose_word
    if word == nil
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
      :dictionary => @dictionary
      :word_in_progress => @word_in_progress
      :past_guesses = @past_guesses
      :word = @word
    })
  end

  def self.from_yaml(string)
    #turn string hash into obj
    data = YAML.load string
    self.new(data[:dictionary], data[:word_in_progress], data[:past_guesses], data[:word])
  end

end
