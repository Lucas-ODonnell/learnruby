require_relative "queen"
class Queen < Piece
    attr_reader :name, :color
    attr_accessor :pos 
    def initialize(color)
        @pos = []
        @color = color 
        @name = @color == "black" ? "\u265B" : "\u2655"
    end
end