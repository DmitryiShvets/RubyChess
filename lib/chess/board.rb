require_relative 'utils'

class Board
  attr_reader :grid

  def self.start_chess
    board = self.new
    8.times do |c|
      board[[c, 1]] = Pawn.new(board, [c, 1], :white) # содание пешек
      board[[c, 6]] = Pawn.new(board, [c, 6], :black)
    end

    [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].each_with_index do |piece_klass, column|
      [[0, :white], [7, :black]].each do |(row, color)|
        location = [column, row]
        board[location] = piece_klass.new(
          board,
          location,
          color
        )
      end
    end

    board
  end

  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }
  end

  def []=(location, piece)
    column, row = location
    grid[column][row] = piece
  end

  def [](location)
    column, row = location
    grid[column][row]
  end

  # проверка на валидность позиции
  def in_bounds?(location)
    column, row = location

    column < grid.length && row < grid.first.length && row >= 0 && column >= 0
  end

  def empty?(location)
    column, row = location
    grid[column][row] == NullPiece.instance
  end

  def in_check?(color)
    king = pieces.find { |p| p.color == color && p.is_a?(King) }

    if king.nil?
      raise 'Король не найден'
    end

    king_pos = king.location

    # loop over all the pieces of the opposite color
    pieces.select { |p| p.color != color }.each do |piece|
      # if any piece has an available move with the position
      # of the king with color, then color is in check.
      if piece.available_moves.include?(king_pos)
        return true
      end
    end

    false
  end

  def checkmate?(color)
    return false if !in_check?(color)
    color_pieces = pieces.select { |p| p.color == color }
    color_pieces.all? { |piece| piece.safe_moves.empty? }
  end

  def pieces
    grid.flatten.reject { |piece| piece.is_a?(NullPiece) }
  end

  def move_piece(start_pos, end_pos)
    # validate that end pos is in safe moves
    piece = self[start_pos]
    unless piece.safe_moves.include?(end_pos)
      raise InvalidMoveError.new(
        "Позиции (#{alphabetOld(end_pos.join('')).join('')}) нет в доступных ходах: #{(piece.safe_moves).map { |item| toNormalForm(item.join(','))}}"
      )
    end
    unless in_bounds?(end_pos)
      raise InvalidMoveError.new('Позиции нет в пределах доски')
    end
    move_piece!(start_pos, end_pos)
  end

  def move_piece!(start_pos, end_pos)
    # remove the piece from the baord at the current location
    # place the piece on the board at the new location
    self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]

    # update the piece's internal location with end pos
    self[end_pos].location = end_pos
  end

  def dup
    new_board = Board.new
    pieces.each do |piece|
      new_piece = piece.class.new(new_board, piece.location, piece.color)
      new_board[new_piece.location] = new_piece
    end
    new_board
  end
end