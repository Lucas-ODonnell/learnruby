require_relative "piece"
class Queen 
    attr_reader :name, :color
    attr_accessor :pos, :count
    def initialize(color)
        @count = 0
        @pos = []
        @color = color 
        @name = @color == "white" ? "\u265B" : "\u2655"
    end

    def valid_move?(new_pos)
      pos = self.pos
      if up_right(pos).include?(new_pos) || up_left(pos).include?(new_pos)
        true
      elsif down_left(pos).include?(new_pos) || down_right(pos).include?(new_pos)
        true
      elsif up(pos).include?(new_pos) || right(pos).include?(new_pos)
        true
      elsif left(pos).include?(new_pos) || down(pos).include?(new_pos)
        true
      else
        false
      end
    end

    def up_right(pos)
      array = [pos] 

      until array.last[0] == 7 || array.last[1] == 7
        array << [array.last[0] + 1, array.last[1] + 1]
      end
      array 
    end

    def up_left(pos)
      array = [pos]
      until array.last[0] == 7 || array.last[1] == 0
        array << [array.last[0] + 1, array.last[1] - 1]
      end
      array
    end

    def down_right(pos)
      array = [pos]
      until array.last[0] == 0 || array.last[1] == 7
        array << [array.last[0] - 1, array.last[1] + 1]
      end
      array
    end

    def down_left(pos)
      array = [pos]
      until array.last[0] == 0 || array.last[1] == 0
        array << [array.last[0] - 1, array.last[1] - 1]
      end
      array
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

