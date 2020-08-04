class Board
    
    def self.grid 
        Array.new(3) {Array.new(3, "_") }
    end
    
    def initialize
        @grid = Board.grid
    end

    ###SUGAR#############
    def [](pos) #pos = [row, col]
        row, col = pos 
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos 
        @grid[row][col] = value 
    end
    #########################

    def print
        @grid.each { |row| puts row.join(" ")}
    end

    def mark_position(pos, value)
        if empty?(pos) && valid_position?(pos)
            self[pos] = value
        else
            puts "That is not a valid position, please try again."
        end
    end
    
    def win?(value)
        all_row?(value) || all_col?(value) || all_diag?(value)
    end
    
    def empty_positions?
        return true until @grid.all? { |rows| rows.all? { |pos| pos != "_"} }
        false
    end

    def empty?(pos)
        return true if self[pos] == "_"
        false
    end

    private

    def valid_position?(pos)
        row, col = pos 
        @grid.each_index do |idx|
            return true if 0 <= idx && idx < @grid.length - 1 && empty?(pos)
        end
        false
    end 
    
    

    def all_row?(value)
        @grid.any? { |row| row.all?(value) }
    end

    def all_col?(value)
        @grid.transpose.any? { |col| col.all?(value) }
    end

    def all_diag?(value)
        left_to_right = (0...@grid.length).all? do |idx|
            pos = [idx, idx]
            self[pos] == value 
        end

        right_to_left = (0...@grid.length).all? do |idx|
            row = idx 
            col = @grid.length - idx - 1 
            pos = [row, col]
            self[pos] == value 
        end
        left_to_right || right_to_left
    end
end