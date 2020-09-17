class Board
  attr_accessor :board
  def initialize
    @board = draw_board
  end

  def draw_board
    skeleton = Array.new(8) {Array.new(8, "x")} 
    (0...skeleton.length).map do |idx1|
      (0...skeleton.length).map do |idx2|
        if idx1.even?
          idx2.even? ? skeleton[idx1][idx2] = "o" : skeleton[idx1][idx2] = "x"
        else
          idx2.odd? ? skeleton[idx1][idx2] = "o" : skeleton[idx1][idx2] = "x"
        end
      end
    end
    skeleton
  end
end

