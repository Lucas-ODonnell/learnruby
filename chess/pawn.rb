require_relative "piece"
require_relative "player"
require_relative "board"
class Pawn 
    attr_reader :color
    attr_accessor :count, :name, :pos   
    def initialize(color)
        @pos = []
        @name = @color == "black" ? "\u265F" : "\u2659"
        @count = 0
        @color = color
    end
end