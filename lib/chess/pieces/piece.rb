class Piece
  attr_reader :color, :board
  attr_accessor :location

  def initialize(board, location, color)
    @board = board
    @color = color
    @location = location
  end

  # Available moves that don't move us into check
  def safe_moves
    moves = []
    # Look at available moves
    available_moves.each do |move|
      # try the move
      new_board = board.dup
      new_board.move_piece!(location, move)
      # if not in check, then the move is safe
      if !new_board.in_check?(color)
        moves << move
      end
    end
    moves
  end

  def enemy?(location)
    board.in_bounds?(location) && board[location].color != color && board[location].class != NullPiece
  end

  def current_r
    location.last
  end

  def current_c
    location.first
  end
end