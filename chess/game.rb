require_relative './lib/piece' 
require_relative './lib/sliding_pieces'
require_relative './lib/jumping_pieces'
require_relative './lib/knight'
require_relative './lib/pawn'
require_relative './lib/king'
require_relative './lib/queen'
require_relative './lib/bishop'
require_relative './lib/rook'
require_relative './lib/board'
require_relative './lib/graphics'

class MoveError < StandardError 
end
class Game
  attr_accessor :board

  def initialize(board, graphics)
    @board = board
    @graphics = graphics
    @teams = [:Black, :White]
    @colors_turn = turn?
  end

  def play
    until checkmated?  
      begin
        starting, ending = @graphics.get_inputs(@colors_turn)
        @board.move(starting, ending, @colors_turn)
      rescue MoveError
     retry
      end
      @colors_turn = turn?
      @graphics.display
    end
    puts "Checkmate"
  end

  def checkmated?
    @board.check?(@colors_turn) && @board.lose?(@colors_turn) || @board.find_king(@colors_turn) == NoMethodError
  end

  def turn?
    @teams.rotate!
    @teams.first
  end
end

board = Board.new
graphics = Graphics.new(board)

game = Game.new(board, graphics)
game.play
