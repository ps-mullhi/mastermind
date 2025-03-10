require_relative 'lib/game_logic.rb'

def valid_guess?(guess)
  unless guess.length == 4
    return false
  end

  approved_chars = ['r', 'y', 'g', 'b', 'p', 'o']

  guess.all? { |char| approved_chars.include?(char) }
end

def get_user_guess()
  i = 0
  loop do
    print('Please enter your guess: ')
    # removes all whitespace, splits in array of chars, and downcases them for easier future comparisons
    guess = gets.gsub(/\s+/, "").split(',').map {|char| char.downcase} 
    valid_guess = valid_guess?(guess)

    puts valid_guess

    i += 1
    break if i > 10
  end
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

  get_user_guess()

end

main()