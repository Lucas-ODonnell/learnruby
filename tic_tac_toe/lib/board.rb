class Board
    def self.grid #make a 3x3 grid 
        Array.new(3) {Array.new(3, "_") }
    end
    
    def initialize
        @grid = Board.grid #Board.new makes a 3x3 grid
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
    
    def print #print each row of the grid as strings
        @grid.each { |row| puts row.join(" ")}
    end

    def mark_position(pos, value) #mark positions if they meet the requirements
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
    #there are no empty positions if all pos of all 
    #rows don't equal "_"
        return true until @grid.all? { |rows| rows.all? { |pos| pos != "_"} }
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
    
    def empty?(pos)
        return true if self[pos] == "_"
        false
    end

    def all_row?(value) 
        @grid.any? { |row| row.all?(value) }
    end

    def all_col?(value) #transpose turn the rows into cols
        @grid.transpose.any? { |col| col.all?(value) }
    end

    def all_diag?(value) #left to right diag is just [0,0][1,1][2,2]
        left_to_right = (0...@grid.length).all? do |idx|
            pos = [idx, idx]
            self[pos] == value 
        end

        right_to_left = (0...@grid.length).all? do |idx|
            row = idx #top row would be 0 first idx is 0
            col = @grid.length - idx - 1 #col will always be @grid.length 1 less than the idx
            pos = [row, col]
            self[pos] == value 
        end
        left_to_right || right_to_left
    end
end