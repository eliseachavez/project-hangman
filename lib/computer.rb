require_relative "display.rb"

class Computer
  include Display
  attr_accessor :word, :guessed_alphabet, :word_progress, :wrong_guess_count

  def initialize(word=nil, guessed_alphabet=[], word_progress=[], wrong_guess_count=0)
    @word = word
    @guessed_alphabet = guessed_alphabet
    @word_progress = word_progress
    @wrong_guess_count = wrong_guess_count
    @dictionary = []
    @alphabet = ["a","b","c","d","e",
      "f","g","h","i","j","k","l","m",
      "n","o","p","q","r","s","t","u",
      "v","w","x","y","z"]
  end

  def choose_word
    if @word == nil
      unfiltered_dictionary = File.open("google-10000-english-no-swears.txt", 'r').readlines.each do |line|
        @dictionary.push(line.chomp) if line.chomp.length > 5
      end
      rand_num = generate_rand_num(@dictionary.length)
      @word = @dictionary[rand_num]
      @word_progress.clear()
      @word_progress = Array.new(@word.size)
    end
  end

  def generate_rand_num(max_size)
    rand_num = rand(max_size)
  end

  def grade_guess(guess)
    @word.each_char.with_index do |char, idx|
      @word_progress[idx] = guess if char == guess
    end

    @wrong_guess_count += 1 if !@word.include?(guess)

    @guessed_alphabet.push(guess) unless @guessed_alphabet.include?(guess)
  end

end
