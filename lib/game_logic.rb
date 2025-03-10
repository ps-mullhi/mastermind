require_relative './color.rb'

module GameLogic

  def self.randomly_generate_answer
    4.times.map { Color.all.sample }
  end

  
end