class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  #метод для ввода команды с консоли
  def get_pos
    gets.chomp.split(",").map { |part| part.to_i }
  end
end