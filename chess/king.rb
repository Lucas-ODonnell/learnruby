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

    def valid_move?(new_position)
      pos = self.pos
      row, col = pos 

      valid_moves = [[row - 1, col], [row - 1, col - 1], [row - 1, col + 1],
                     [row, col + 1],[row, col - 1], [row + 1, col], [row + 1, col - 1],
                     [row + 1, col + 1]] 

      if valid_moves.include?(new_position) && on_board?(new_position)
        true
      else
        false
      end
    end

    def on_board?(new_position)
      row, col = new_position
      if row < 8 && row >= 0 && col < 8 && col >= 0
        true
      else
        false
      end
    end
end
