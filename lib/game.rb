require_relative "display.rb"
class Game
  include Display

  def initialize(dictionary=[], word=nil)
    @dictionary = []
    @word = choose_word
    play_game
  end

  def play_game
    print_greeting

  end

  def choose_word
    unfiltered_dictionary = File.open("google-10000-english-no-swears.txt", 'r').readlines.each do |line|
      @dictionary.push(line.chomp) if line.chomp.length > 5
    end
    rand_num = generate_rand_num(@dictionary.length)
    @dictionary[rand_num]
  end

  def generate_rand_num(max_size)
    rand_num = rand(max_size)
  end


end
