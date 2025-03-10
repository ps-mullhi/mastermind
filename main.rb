require_relative 'lib/game_logic.rb'
require_relative 'lib/guess.rb'

def valid_guess?(guess)
  unless guess.length == 4
    return false
  end

  approved_chars = ['r', 'y', 'g', 'b', 'p', 'o']

  guess.all? { |char| approved_chars.include?(char) }
end

def get_user_guess()
  guess = ""

  loop do
    print('Please enter your guess: ')
    # removes all whitespace, splits in array of chars, and downcases them for easier future comparisons
    guess = gets.gsub(/\s+/, "").split(',').map {|char| char.downcase} 
    is_guess_valid = valid_guess?(guess)
    
    break if is_guess_valid

    puts("Invalid guess. Please enter only 4 chars, and they must all be valid first letters of 6 colors above.")
  end

  guess
end

def welcome_message()
  puts('Welcome to mastermind!')
  puts('There are 6 possible colors: Red, Green, Blue, Yellow, Purple, Orange.')
  puts('When you guess the 4 color code, simply enter the first letter of each with a comma between them.')
  puts('For example, the guess \'g, r, b, y\' equates to guessing \'Green, Red, Blue, Yellow\'')
  puts("\nYou have 12 guesses to crack the code, good luck!")
end

def main()
  welcome_message()

  answer = GameLogic.randomly_generate_answer
  puts(answer)

  guess = Guess.new(get_user_guess())
  
  num_partially_correct, num_fully_correct = GameLogic.compare_answer(guess, answer)
  
  
end

main()