require_relative "piece"
class Bishop < Piece
    attr_reader :name, :color
    def initialize(color)
        @color = color 
        @name = @color == "black" ? "\u265D" : "\u2657"
    end
end