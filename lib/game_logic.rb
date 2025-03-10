require_relative './color.rb'

module GameLogic

  def self.randomly_generate_answer
    4.times.map { Color.all.sample }
  end

  def self.compare_answer(guess, answer)
    guess_as_array = Array.new()

    guess.guess.each() do |peg|
      guess_as_array.push(peg.color)
    end

    common_elements = 0
    num_fully_correct = 0
    guess_as_array.each_with_index() do |guess, i|
      if guess_as_array[i] == answer[i]
        num_fully_correct += 1
      end

      if answer.include?(guess_as_array[i])
        common_elements += 1
      end
    end

    num_partially_correct = common_elements - num_fully_correct

    [num_partially_correct, num_fully_correct]
  end
end