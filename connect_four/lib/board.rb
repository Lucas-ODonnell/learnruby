class Board
    attr_accessor :board, :physics 
    def initialize
        @board = Array.new(6) {Array.new(7,"O")}
        @physics = board_physics 
    end
    
    def board_physics
        hash = Hash.new { |h,k| h[k] = [] }
        board.each.with_index do |row, idx_1|
            row.each.with_index do |ele, idx_2|
                hash[idx_2] << [idx_1, idx_2] 
            end
        end
        hash
    end

    def print
        self.board.each { |row| puts row.join("  ")}
    end

    def mark_position(col, color)
        players_choice = physics[col].pop
        return "That row is filled" if players_choice.nil?
        row, col = players_choice 
        @board[row][col] = color 
    end

    def win?(color)
        return true if vertical_win?(color) || horizontal_win?(color) || left_diagonal_win?(color) || right_diagonal_win?(color)
        false
    end

    def gameover?
        self.board.each do |row|
            return false if row.any? { |pos| pos == "O" }
        end
        true
    end
    
    private 

    def vertical_win?(color)
        count = 0
        0.upto(6).each do |num1|
            0.upto(5).each do |num2|
                if count == 4
                    return true 
                elsif self.board[num2][num1] == color 
                    count += 1
                else
                    count = 0
                end
            end
        end
        #This is so the last column works 
        if count == 4 
            return true
        else 
            false
        end 
    end

    def horizontal_win?(color)
        count = 0
        0.upto(5).each do |num1|
            0.upto(6).each do |num2|
                if count == 4
                    return true 
                elsif self.board[num1][num2] == color 
                    count += 1
                else
                    count = 0
                end
            end
        end
        #This is so the last row will work
        if count == 4 
            return true
        else 
            false
        end 
    end

    def left_diagonal_win?(color)
        0.upto(5).each do |num1|
            0.upto(6).each do |num2|
                next if num1 + 3 > 5 || num2 + 3 > 6
                if  self.board[num1][num2] == color &&  self.board[num1+1][num2+1] == color && self.board[num1+2][num2+2] == color &&  self.board[num1+3][num2+3] == color
                    return true 
                end
            end
        end
        false
    end

    def right_diagonal_win?(color)
        0.upto(5).each do |num1|
            0.upto(6).each do |num2|
                next if num1 + 3 > 5 || num2 - 3 < 0
                if  self.board[num1][num2] == color &&  self.board[num1+1][num2-1] == color && self.board[num1+2][num2-2] == color &&  self.board[num1+3][num2-3] == color
                    return true 
                end
            end
        end
        false
    end
end