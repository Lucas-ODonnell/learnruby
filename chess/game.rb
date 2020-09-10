require "./board.rb"
require "./player.rb"
require "./piece.rb"
require "./pawn.rb"
require "./bishop.rb"
require "./king.rb"
require "./queen.rb"
require "./rook.rb"
require "./knight.rb"

class Game 
    attr_accessor :white_pawns, :black_pawns, :board
    attr_reader :player1, :player2
    def initialize
        @board = Board.new
        @player1 = Player.new("white")
        @player2 = Player.new("black")
    end

    def [](pos)
        row, col = pos
        board[row][col]
    end

    def []=(pos, value)
        row, col = pos
        board[row][col] = value 
    end

    def set_board
        (0...self.board.length).each do |idx1|
            (0...self.board.length).each do |idx2|
                if idx1 == 6
                    var1 = Pawn.new(player1.color)
                    self.board.board[idx1][idx2] = var1
                elsif idx1 == 1
                    var2 = Pawn.new(player2.color)
                    self.board.board[idx1][idx2] = var2
                elsif idx1 == 7
                    self.board.board[idx1][0] = Rook.new(player1.color) && self.board.board[idx1][7] = Rook.new(player1.color)
                    self.board.board[idx1][1] = Knight.new(player1.color) && self.board.board[idx1][6] = Knight.new(player1.color)
                    self.board.board[idx1][2] = Bishop.new(player1.color) && self.board.board[idx1][5] = Bishop.new(player1.color)
                    self.board.board[idx1][3] = Queen.new(player1.color) 
                    self.board.board[idx1][4] = King.new(player1.color)
                elsif idx1 == 0 
                    self.board.board[idx1][0] = Rook.new(player2.color) && self.board.board[idx1][7] = Rook.new(player2.color)
                    self.board.board[idx1][1] = Knight.new(player2.color) && self.board.board[idx1][6] = Knight.new(player2.color)
                    self.board.board[idx1][2] = Bishop.new(player2.color) && self.board.board[idx1][5] = Bishop.new(player2.color)
                    self.board.board[idx1][3] = Queen.new(player2.color) 
                    self.board.board[idx1][4] = King.new(player2.color)
                end
            end
        end
    end

    
end