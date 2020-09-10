require_relative "piece"
class Bishop < Piece
    attr_reader :name, :color
    attr_accessor :pos 
    def initialize(color)
        @pos = []
        @color = color 
        @name = @color == "black" ? "\u265D" : "\u2657"
    end
end