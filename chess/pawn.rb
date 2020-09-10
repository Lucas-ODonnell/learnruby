require_relative "piece"
require_relative "player"
require_relative "board"
class Pawn < Piece
    attr_reader :color
    attr_accessor :count, :name   
    def initialize(color)
        @name = @color == "black" ? "\u265F" : "\u2659"
        @count = 0
        @color = color
    end
end