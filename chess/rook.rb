require_relative "piece"
class Rook 
    attr_reader :color, :name
    attr_accessor :pos, :count 
    def initialize(color)
        @count = 0
        @pos = [] 
        @color = color 
        @name = @color == "black" ? "\u265C" : "\u2656"
    end

    def valid_move
    end
end