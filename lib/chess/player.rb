class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def alphabet (pos)
    case pos[0]
    when 'a'
      arr_pos = ["#{0}","#{pos[1].to_i - 1}"]
      # arr_pos.map { |part| part.to_i unless part.empty? }
    when 'b'
      arr_pos = ["#{1}","#{pos[1].to_i - 1}"]
      #arr_pos.map { |part| part.to_i unless part.empty? }
    when 'c'
      arr_pos = ["#{2}","#{pos[1].to_i - 1}"]
      #arr_pos.map { |part| part.to_i unless part.empty? }
    when 'd'
      arr_pos = ["#{3}","#{pos[1].to_i - 1}"]
      #arr_pos.map { |part| part.to_i unless part.empty? }
    when 'e'
      arr_pos = ["#{4}","#{pos[1].to_i - 1}"]
      #arr_pos.map { |part| part.to_i unless part.empty? }
    when 'f'
      arr_pos = ["#{5}","#{pos[1].to_i - 1}"]
      #arr_pos.map { |part| part.to_i unless part.empty? }
    when 'g'
      arr_pos = ["#{6}","#{pos[1].to_i - 1}"]
      #arr_pos.map { |part| part.to_i unless part.empty? }
    when 'h'
      arr_pos = ["#{7}","#{pos[1].to_i - 1}"]
      #arr_pos.map { |part| part.to_i unless part.empty? }
    end
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



        pos = str_pos.split('')
        arr_pos = alphabet(pos)
        arr_pos.map { |part| part.to_i unless part.empty? }

      # end
    end
  end
end