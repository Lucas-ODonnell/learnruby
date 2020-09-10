require_relative "queen"
class Queen < Piece
    attr_reader :name, :color 
    def initialize(color)
        @color = color 
        @name = @color == "black" ? "\u265B" : "\u2655"
    end
end