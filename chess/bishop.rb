require_relative "piece"
class Bishop 
    attr_reader :name, :color
    attr_accessor :pos, :count
    def initialize(color)
        @count = 0
        @pos = []
        @color = color 
        @name = @color == "black" ? "\u265D" : "\u2657"
    end
end