class Board
    attr_accessor :board
    def initialize
        @board = chess_board
    end
    
    def chess_board
        colors = ["o", "x"]
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

    def length
        @board.length 
    end

    def print_board
        printed = @board.map do |row|
            row.map do |col|
                if col == "o"
                    "o"
                elsif col == "x"
                    "x"
                else
                    col.name
                end 
            end
        end

        printed.each { |row| puts row.join(" ")}

    end
    
    def valid_position?(pos)
        return false if pos.any? { |ele| ele > 7 || ele < 0 }   
        true
    end
end