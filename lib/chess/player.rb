require_relative 'utils'
class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end



  #метод для ввода команды с консоли
  def get_pos
    str_pos = gets.chomp
    return [-1, -1] if str_pos.empty?

    case str_pos
    when 'exit'
      abort "Игра прекращена"
    else

      # if(str_pos.include?(','))
      #   puts str_pos.split('')
      #   arr_pos = str_pos.split(',')
      #   arr_pos.map { |part| part.to_i unless part.empty? }
      #
      # else



        pos = toNormalForm(str_pos)
        arr_pos = alphabet(pos.split(''))
        arr_pos.map { |part| part.to_i unless part.empty? }

      # end
    end
  end
end