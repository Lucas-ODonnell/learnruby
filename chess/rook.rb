require_relative "piece"
class Rook 
    attr_reader :color, :name
    attr_accessor :pos, :count 
    def initialize(color)
        @count = 0
        @pos = [] 
        @color = color 
        @name = @color == "white" ? "\u265C" : "\u2656"
    end

    def valid_move?(new_pos)
      pos = self.pos
      range = (0..7)
      row, col = new_pos
      row1, col1 = pos
      if range.include?(row) && col1 == col
        true
      elsif row == row1 && range.include?(col)
        true
      else
        false
      end
    end
end

