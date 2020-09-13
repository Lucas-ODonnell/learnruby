module Piece
  def move_position(starting, ending)
        board = self.board.board 
        row, col = starting
        row1, col1 = ending 
        piece = board[row][col]
        if board[row1][col1] == "x" || board[row1][col1] == "o" 
            return "That is not valid" unless piece.valid_move?(ending)
            board[row1][col1] = piece
            board[row1][col1].count += 1 
            piece.pos = [row1,col1]
        elsif board[row1][col1].color != piece.color 
            return "That is not valid" unless piece.valid_move?(ending)
            board[row1][col1] = piece
            board[row1][col1].count += 1
            piece.pos = [row1,col1]
        else
            return "That is not a valid position"
        end

        if starting[0].even?
            starting[1].even? ? board[row][col] = "o" : board[row][col] = "x"
        else 
            starting[1].even? ? board[row][col] = "x" : board[row][col] = "o"
        end 
    end
end
