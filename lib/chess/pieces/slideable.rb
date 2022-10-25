module Slideable
  def available_moves
    moves = []

    move_dirs.each do |(dr, dc)|
      current_r, current_c = location
      # print current_r.to_s + current_c.to_s+"\n"
      loop do
        current_r += dr
        current_c += dc
        loc = [current_r, current_c]
        # print '  '+loc.to_s + "\n"
        break if !board.in_bounds?(loc)
        if board.empty?(loc)
          moves << loc
        end
        if enemy?(loc)
          moves << loc
          break
        end
        if allied?(loc)
          break
        end
      end
    end
    moves
  end
end