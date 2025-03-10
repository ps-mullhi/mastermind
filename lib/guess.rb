require_relative './peg.rb'
require_relative './color.rb'

class Guess
  attr_reader :guess
  
  def initialize(guess)
    @guess = convert_csv_guess_to_object(guess)
  end

  def convert_csv_guess_to_object(csv_guess)
    guess = Array.new()

    csv_guess.each do |char|
      case char
      when 'y'
        guess.push(Peg.new(Color::YELLOW))
      when 'r'
        guess.push(Peg.new(Color::RED))
      when 'b'
        guess.push(Peg.new(Color::BLUE))
      when 'g'
        guess.push(Peg.new(Color::GREEN))
      when 'o'
        guess.push(Peg.new(Color::ORANGE))
      when 'p'
        guess.push(Peg.new(Color::PURPLE))
      end
    end

    guess
  end
    
  
end