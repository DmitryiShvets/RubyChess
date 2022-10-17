# frozen_string_literal: true

require_relative "chess/version"
require_relative 'chess/SASDADAA'
require_relative 'chess/invalid_move_error'
require_relative 'chess/pieces'
require_relative 'chess/board_renderer_text'
require_relative 'chess/board'
require_relative 'chess/player'
require_relative 'chess/game'

module Chess
  class Error < StandardError;
  end

  extend self

  def initialize()
    @gameMode = 1
  end

  def start
    if (@gameMode == 1)
      startLogic()
      return 'Game is starting'
    else
      puts 'Для запуска установите интерактивный режим'
    end

  end

  def startLogic
    b = Board.start_chess
    g = Game.new(
      b,
      Player.new(:black),
      Player.new(:white),
      BoardRendererText
    )
    g.play
  end



  def changeGameMode
    if (@gameMode == 0)
      @gameMode = 1
      puts 'Игровой режим изменён на интерактивный'
    else
      @gameMode = 0
      puts 'Игровой режим изменён на внутренний'
    end

    return @gameMode
  end


end
