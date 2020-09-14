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

    def valid_move?(new_position)
      pos = self.pos
      row, col = pos 
      valid_positions = [[row + 2, col + 1],[row + 2, col - 1],[row + 1, col + 2],
                         [row - 1, col - 2], [row - 2, col - 1], [row - 2, col + 1],
                        [row + 1, col - 2], [row - 1, col + 2]]
      if valid_positions.include?(new_position) && on_board?(new_position)
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

    
