require "./lib/board"

describe Board do 
    let(:board) { Board.new }
    describe "#initialize"
    it "should make a board that has 7 columns and 6 rows" do 
        board
    end

    describe "#board_physics" do 
        it "should make a hash where the index makes up the column" do
            test = {0=>[[0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0]],
   1=>[[0, 1], [1, 1], [2, 1], [3, 1], [4, 1], [5, 1]],
   2=>[[0, 2], [1, 2], [2, 2], [3, 2], [4, 2], [5, 2]],
   3=>[[0, 3], [1, 3], [2, 3], [3, 3], [4, 3], [5, 3]],
   4=>[[0, 4], [1, 4], [2, 4], [3, 4], [4, 4], [5, 4]],
   5=>[[0, 5], [1, 5], [2, 5], [3, 5], [4, 5], [5, 5]],
   6=>[[0, 6], [1, 6], [2, 6], [3, 6], [4, 6], [5, 6]]}
            expect(board.board_physics).to eql(test)
        end
    end

    describe "#mark_position" do 
        it "should add a color to the lowest empty position on the selected
            row" do 
            expect(board.mark_position(0,"red")).to eql(board.board[5][0])
        end

        it "should pop the chosen position to prevent duplicates" do 
            board.mark_position(1, "yellow")
            expect(board.physics[1].length).to eql(5)
        end
    end

    describe "#win?" do 
        it "should return false if there are no four in a row" do 
            expect(board.win?("red")).to eql(false)
        end

        it "should return true if four in a row vertical are the same color" do 
            4.times { board.mark_position(0, "red") }
            expect(board.win?("red")).to eql(true)
        end

        it "should return true if four in a row horizontal are the same color" do 
            board.mark_position(1, "yellow")
            board.mark_position(2, "yellow")
            board.mark_position(3, "yellow")
            board.mark_position(4, "yellow")
            expect(board.win?("yellow")).to eql(true)
        end

        it "should return true if four left to right diagonal are the same color" do 
            board.board[0][1] = "purple"
            board.board[1][2] = "purple"
            board.board[2][3] = "purple"
            board.board[3][4] = "purple"
            expect(board.win?("purple")).to eql(true)
        end

        it "should return true if four right to left diagonal are the same color" do 
            board.board[0][6] = "black"
            board.board[1][5] = "black"
            board.board[2][4] = "black"
            board.board[3][3] = "black"
            expect(board.win?("black")).to eql(true)
        end
    end
    let (:board) { Board.new }
    describe "#gameover" do 
        it "should return false unless all positions are filled or somebody wins" do
            expect(board.gameover?).to eql(false)
        end
    end 

end