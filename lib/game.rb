require_relative "print.rb"
class Game

  def initialize
    @dictionary = []
    @word = choose_word
    start_game
  end

  def start_game
    print_greeting

  end

  def choose_word
    rand_num = generate_rand_num(File.size("google-10000-english-no-swears.txt"))

    dictionary = File.open("google-10000-english-no-swears.txt", 'r').readlines.each do |line|
      @dictionary.push(line.chomp) if line.chomp.length > 5
    end

    @dictionary[rand_num]
  end

  def generate_rand_num(max_size)
    rand_num = rand(max_size)
  end

end
