require_relative "piece"
class King < Piece
    attr_reader :name, :color
    def initialize(color)
        @color = color 
        @name = @color == "black" ? "\u265A" : "\u2654"
    end
end