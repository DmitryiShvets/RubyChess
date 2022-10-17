# frozen_string_literal: true

require_relative "chess/version"
require_relative 'chess/SASDADAA'

require_relative 'chess/invalid_move_error'
require_relative 'chess/pieces'
require_relative 'chess/board_renderer_text'
require_relative 'chess/board'
require_relative 'chess/player'
require_relative 'chess/game'
# module Chess
#   class Error < StandardError; end
#
# extend self
#   def hello
#     'Hello'
#   end
#     def test1
#       test()
#   end
#
# end

module Chess
  class Error < StandardError;
  end

  extend self
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
