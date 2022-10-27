# frozen_string_literal: true

require_relative "chess/version"

require_relative 'chess/invalid_move_error'
require_relative 'chess/invalid_figure_error'
require_relative 'chess/pieces'
require_relative 'chess/board_renderer_text'
require_relative 'chess/board'
require_relative 'chess/player'
require_relative 'chess/game'

module Chess
  class Error < StandardError; end

  extend self

  def _chooseCommand
    loop do
      puts "\n\n\n\n\nСписок команд:"
      puts 'new - начать новую игру'
      puts 'exit - выход в меню'
      puts 'surrender - сдаться'
      puts 'stop - остановка программы'
      puts
      puts 'Введите команду'
      command = gets.chomp
      case command
      when 'exit'
        puts 'Выход'
        break
      when 'surrender'
        puts 'Вы ещё не начали игру'
      when 'stop'
        abort('Вы вышли из игры')
      when 'new'
        _startLogic
      end
    end
  end

  def start
    _chooseCommand
  end

  def _startLogic
    b = Board.start_chess
    g = Game.new(b, Player.new(:white), Player.new(:black), BoardRendererText)
    g.play
  end

  # Chess.start

end
