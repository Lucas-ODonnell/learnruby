require_relative "piece"
class Rook < Piece
    attr_reader :color, :name
    attr_accessor :pos 
    def initialize(color)
        @pos = [] 
        @color = color 
        @name = @color == "black" ? "\u265C" : "\u2656"
    end

    def valid_move
    end
end