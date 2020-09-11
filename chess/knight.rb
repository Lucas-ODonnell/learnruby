require_relative "piece"
class Knight 
    attr_reader :color, :name
    attr_accessor :pos, :count  
    def initialize(color)
        @count = 0
        @pos = []
        @color = color 
        @name = @color == "white" ? "\u265E" : "\u2658"
    end
end

    