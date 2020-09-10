require_relative "piece"
class Rook < Piece
    attr_reader :color, :name 
    def initialize(color)
        @color = color 
        @name = @color == "black" ? "\u265C" : "\u2656"
    end
end