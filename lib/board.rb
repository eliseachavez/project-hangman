require_relative "display.rb"

class Board
  include Display

  def initialize
    @hangman_series = ['''
      +---+
          |
          |
          |
          |
          |
    =========''','''
      +---+
      |   |
          |
          |
          |
          |
    =========''', '''
      +---+
      |   |
      O   |
          |
          |
          |
    =========''', '''
      +---+
      |   |
      O   |
      |   |
          |
          |
    =========''', '''
      +---+
      |   |
      O   |
     /|   |
          |
          |
    =========''', '''
      +---+
      |   |
      O   |
     /|\  |
          |
          |
    =========''', '''
      +---+
      |   |
      O   |
     /|\  |
     /    |
          |
    =========''', '''
      +---+
      |   |
      O   |
     /|\  |
     / \  |
          |
    =========''']
  end

  def print_word_progress(word, wrong_guess_count, guessed_alphabet)
    print_hangman(@hangman_series[wrong_guess_count])
    print_guessed_word(word)
    print_remaining_words(guessed_alphabet)
  end

end
