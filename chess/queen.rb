require_relative "queen"
class Queen 
    attr_reader :name, :color
    attr_accessor :pos, :count
    def initialize(color)
        @count = 0
        @pos = []
        @color = color 
        @name = @color == "white" ? "\u265B" : "\u2655"
    end
end
