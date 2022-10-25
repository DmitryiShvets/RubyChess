class Game
  attr_reader :player1, :player2, :board, :renderer
  attr_accessor :current_player

  def initialize(board, player1, player2, renderer_class)
    @board = board
    @renderer = renderer_class.new(board)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def swap_player!
    self.current_player = (current_player == player1 ? player2 : player1)
  end

  def play



    while !over?
      renderer.render
      puts "Ход #{current_player.color}'s фигур"
      if board.in_check?(current_player.color)
        puts "#{current_player.color} поставлен шах"
      end
      take_turn
      swap_player!
    end

    swap_player!
    puts "Игра окончена! Победитель: #{current_player.color}"
    renderer.render
  end

  def over?
    board.checkmate?(current_player.color)
  end

  #hod
  def take_turn
    start_pos = nil
    # Prompt current player to enter a starting pos
    # while true
    loop do
      puts "Выберите фигуру: "
      start_pos = current_player.get_pos
      if board[start_pos].color == current_player.color
        puts board[start_pos].to_s
        break
      end
      puts "Не выбрана #{current_player.color} фигура."
    end

    # Prompt current player to enter an ending pos
    loop do
      puts "Выберите позицию для перехода:"
      end_pos = current_player.get_pos

      # Move the piece
      begin
        board.move_piece(start_pos, end_pos)
        break
      rescue InvalidMoveError => e
        puts e.message
      end
    end
  end
end