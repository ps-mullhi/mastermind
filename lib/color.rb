module Color
  RED = :red
  GREEN = :green
  BLUE = :blue
  YELLOW = :yellow
  ORANGE = :orange
  PURPLE = :purple

  def self.all
    constants.map { |c| const_get(c)}
  end
end