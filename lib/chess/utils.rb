def numeric?
  Float(self) != nil rescue false
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

def alphabetOld (pos)

  case pos[0]
  when '0'
    arr_pos = ["a","#{pos[1].to_i + 1}"]
    # arr_pos.map { |part| part.to_i unless part.empty? }
  when '1'
    arr_pos = ["b","#{pos[1].to_i + 1}"]
    #arr_pos.map { |part| part.to_i unless part.empty? }
  when '2'
    arr_pos = ["c","#{pos[1].to_i + 1}"]
    #arr_pos.map { |part| part.to_i unless part.empty? }
  when '3'
    arr_pos = ["d","#{pos[1].to_i + 1}"]
    #arr_pos.map { |part| part.to_i unless part.empty? }
  when '4'
    arr_pos = ["e","#{pos[1].to_i + 1}"]
    #arr_pos.map { |part| part.to_i unless part.empty? }
  when '5'
    arr_pos = ["f","#{pos[1].to_i + 1}"]
    #arr_pos.map { |part| part.to_i unless part.empty? }
  when '6'
    arr_pos = ["g","#{pos[1].to_i + 1}"]
    #arr_pos.map { |part| part.to_i unless part.empty? }
  when '7'
    arr_pos = ["h","#{pos[1].to_i + 1}"]
    #arr_pos.map { |part| part.to_i unless part.empty? }
  end


end




def toNormalForm (pos)
  arr_pos = pos.split('').map(&:downcase)
  if (arr_pos.length <= 2)


    if ((arr_pos[0] =~ (/^[a-z]/)) && (arr_pos[1] =~ (/^\d+$/)))
      return arr_pos.join()
    elsif ((arr_pos[0] =~ (/^\d+$/)) && (arr_pos[1] =~ (/^[a-z]/)))
      return arr_pos.reverse.join()
    else
      return [-1,-1]
    end

  elsif (arr_pos.join('') =~ (/^\d+[,]{1}\d+$/))
    return alphabetOld(arr_pos.join('').split(','))
  else
    return [-1,-1]
  end

end

puts toNormalForm('1a')
puts toNormalForm('a1')
puts toNormalForm('1,1')
