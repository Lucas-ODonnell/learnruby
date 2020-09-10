require_relative "piece"
class Knight < Piece
    attr_reader :color, :name
    attr_accessor :pos 
    def initialize(color)
        @pos = []
        @color = color 
        @name = @color == "black" ? "\u265E" : "\u2658"
    end
end

    