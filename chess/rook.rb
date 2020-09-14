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
      if up(pos).include?(new_pos) || left(pos).include?(new_pos)
        true
      elsif right(pos).include?(new_pos) || down(pos).include?(new_pos)
        true
      else
        false
      end
    end
      
    def up(pos)
      array = [pos] 
      until array.last[0] == 0 
        array << [array.last[0] - 1, array.last[1]]
      end
      array 
    end

    def left(pos)
      array = [pos]
      until array.last[1] == 0
        array << [array.last[0], array.last[1] - 1]
      end
      array
    end

    def right(pos)
      array = [pos]
      until array.last[1] == 7
        array << [array.last[0], array.last[1] + 1]
      end
      array
    end

    def down(pos)
      array = [pos]
      until array.last[0] == 7
        array << [array.last[0] + 1, array.last[1]]
      end
      array
    end
end

