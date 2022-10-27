require_relative 'status_codes'
require_relative 'utils'
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

      puts "Ход #{current_player == player1 ? 'белых' : 'чёрных'} фигур"

      if board.in_check?(current_player.color)
        puts "#{current_player == player1 ? 'белым' : 'чёрным'} поставлен шах"
      end

      loop do
        begin
          st_pos = get_user_input
          if st_pos == EXIT
            puts 'Игра прекращена'
            return
          end
          if st_pos == SUR
            puts "#{current_player == player1 ? 'Белые' : 'Чёрные'} сдались"
            swap_player!
            puts "Игра окончена! Победитель: #{current_player == player1 ? 'белые' : 'чёрные'}"
            return
          end
          take_turn(st_pos)
          break
        rescue InvalidFigureError => e
          puts e.message
          puts "Ход #{current_player == player1 ? 'белых' : 'чёрных'} фигур"
        end
      end
      swap_player!
    end

    swap_player!
    puts "Игра окончена! Победитель: #{current_player == player1 ? 'белые' : 'чёрные'}"
    renderer.render
  end

  def over?
    board.checkmate?(current_player.color)
  end

  #метод для ввода команды с консоли
  def get_user_input
    str_pos = gets.chomp
    return CF if str_pos.empty?

    case str_pos
    when 'exit'
      return EXIT

    when 'surrender'
      return SUR

    else

      if(isCorrect?(toNormalForm(str_pos)))
        pos = toNormalForm(str_pos)
        arr_pos = alphabet(pos.split(''))
        arr_pos.map { |part| part.to_i unless part.empty? }
      else
        CF
      end



    end
  end

  def take_turn(start_pos)

    if start_pos == CF
      raise InvalidFigureError.new("Ошибка! Выберите #{current_player == player1 ? 'белую' : 'чёрную'} фигуру")
    end
    # Prompt current player to enter a starting pos
    if board[start_pos].color != current_player.color
      raise InvalidFigureError.new("Ошибка! Вы не можете ходить этой фигурой " + board[start_pos].to_s + ". Выберите #{current_player == player1 ? 'белую' : 'чёрную'} фигуру")
    end
    if board[start_pos].safe_moves == []
      raise InvalidFigureError.new("Ошибка! Вы не можете ходить этой фигурой " + board[start_pos].to_s + ". Нет доступных ходов")
    end

    puts board[start_pos].to_s

    # Prompt current player to enter an ending pos
    loop do
      puts "Выберите позицию для перехода:"
      end_pos = get_user_input
      if end_pos == CF
        raise InvalidFigureError.new("Ошибка! Выберите #{current_player == player1 ? 'белую' : 'чёрную'} фигуру")
      end
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