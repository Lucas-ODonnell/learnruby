class Board
    attr_accessor :board
    def initialize
        @board = chess_board 
    end

    def chess_board
        colors = ["W", "B"]
        board = Array.new(8) {Array.new(8)}
        board.each.with_index do |row, idx1|
            row.each.with_index do |pos, idx2|
                board[idx1][idx2] = colors.first
                colors.rotate!
            end
        end
        board.each.with_index do |row, idx|
            row.rotate! unless idx.even?
        end
        board
    end

    def print
        @board.each { |row| puts puts puts row.join("     ") } 
    end
    
    def valid_position?(pos)
        return false if pos.any? { |ele| ele > 7 || ele < 0 }   
        true
    end

    def [](pos)
        row, col = pos 
        @board[row][col]
    end

end