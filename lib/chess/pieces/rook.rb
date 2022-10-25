class Rook < Piece
  include Slideable

  def to_s
    color == :white ? "♜" : "♖"
  end

  def move_dirs
    [
      [0, 1],     # forward direction
      [0, -1],    # back
      [1, 0],     # right
      [-1, 0]     # left
    ]
  end
end