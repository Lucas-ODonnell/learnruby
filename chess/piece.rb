module Piece
    def move_position(starting, ending)
        board = self.board.board 
        pos, col = starting
        pos1, col1 = ending 
        starting_pos = board[pos][col]
        
        if board[pos1][col1] == "x" || board[pos1][col1] == "o"
            board[pos1][col1] = starting_pos
            board[pos1][col1].count += 1 
        elsif board[pos1][col1].color != starting_pos.color
            board[pos1][col1] = starting_pos
            board[pos1][col1].count += 1
        else
            puts "That is not a valid move!"
            return 
        end

        if starting[0].even?
            starting[1].even? ? board[pos][col] = "o" : board[pos][col] = "x"
        else 
            starting[1].even? ? board[pos][col] = "x" : board[pos][col] = "o"
        end 
    end
end