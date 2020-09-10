require_relative "piece"
class King < Piece
    attr_reader :name, :color
    attr_accessor :pos 
    def initialize(color)
        @pos = []
        @color = color 
        @name = @color == "black" ? "\u265A" : "\u2654"
    end
end