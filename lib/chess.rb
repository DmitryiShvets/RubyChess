# frozen_string_literal: true

require_relative "chess/version"
require_relative 'src/invalid_move_error.rb'
require_relative 'src/pieces.rb'
require_relative 'src/board_renderer_text.rb'
require_relative 'src/board.rb'
require_relative 'src/player.rb'
require_relative 'src/game.rb'

module Chess
  class Error < StandardError;
  end


  def start
    startLogic()
    return 'Game is starting'
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

end
