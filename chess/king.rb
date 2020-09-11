require_relative "piece"
class King 
    attr_reader :name, :color
    attr_accessor :pos, :count
    def initialize(color)
        @count = 0
        @pos = []
        @color = color 
        @name = @color == "white" ? "\u265A" : "\u2654"
    end
end