require "./lib/board"

describe Board do 
    let (:board)  { Board.new }
    describe ".grid" do 
        it "should return a 3x3 grid" do 
            expect(Board.grid.length).to eql(3)
            expect(Board.grid[0].length).to eql(3)
        end

        it "should set all elements to -" do 
            correct = Array.new(3) { Array.new(3, "_") }
            expect(Board.grid).to eql(correct)
        end
    end

    describe "#initialize" do 
        it "not take any variables" do
            board 
        end

        it "should set @grid to Board.grid" do 
            @grid == Board.grid
        end
    end

    describe "#[]" do
        it "should accept an array of indices representing [row, column] 
        representing a position on the board" do 
            pos = [1,1]
            board[pos]
        end

        it "should return the element of @grid at the given position" do
        grid = board.instance_variable_get(:@grid)
        grid[1][1] = "_"

        pos_1 = [1, 1]
        expect(board[pos_1]).to eql("_")

        pos_2 = [0, 0]
        expect(board[pos_2]).to eql("_")
      end
    end

    describe "#[]=" do 
        it "should accept a position and value as arguments" do
            pos = [1,1]
            board[pos] = :X 
            expect(board[pos]).to eql(:X)
        end
    end

    describe "#win?" do
       it "should return true if a player has won" do
        pos_1 = [0,1]
        pos_2 = [0,0]
        pos_3 = [0,2]
        board[pos_1] = :X 
        board[pos_2] = :X 
        board[pos_3] = :X 

        expect(board.win?(:X)).to eql(true)

        board[pos_3] = :Y

        expect(board.win?(:X)).to eql(false)
       end
    end

    describe "#empty_positions?" do
        it "should return true unless every spot is taken" do 
            expect(board.empty_positions?).to eql(true)
        end 
    end

    describe "#mark_position" do 
        it "should mark the position on the board with the given value" do 
            pos = [1, 1]
            pos_1 = [2,2]
            board.mark_position(pos, :X)
            expect(board[pos] == :X).to eql(true)
            expect(board[pos_1] == :X).to eql(false)
        end
    end
end

