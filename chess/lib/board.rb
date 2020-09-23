class Board
  attr_accessor :grid
  attr_reader :size

  def initialize
    @pawns       = ["  ♟  ", "  ♟  "]
    @kings       = ["  ♚  ", "  ♚  "]
    @queens      = ["  ♛  ", "  ♛  "]
    @bishops     = ["  ♝  ", "  ♝  "]
    @knights     = ["  ♞  ", "  ♞  "]
    @rooks       = ["  ♜  ", "  ♜  "]
    build_board
  end
 
  def move(starting, ending, colors_turn)
    row1, col1 = starting
    row2, col2 = ending
    piece = @grid[row1][col1]
    current_status(starting, ending, colors_turn, piece)
    piece.mark
    execute_move(starting, ending)
    promote(piece) if piece.promotion? == true
  end

  def promote(piece)
    position = piece.position
    row, col = position
    color = piece.color
    self.grid[row][col] = nil
    self.grid[row][col] = Queen.new(position, @queens[1], color, self)
  end

  def current_status(starting, ending, colors_turn, piece)
    row1, col1 = starting
    row2, col2 = ending
    if piece.nil?
      raise MoveError.new("Your intial square is not occupied")
    elsif piece.color != colors_turn
      raise MoveError.new("Wrong color!")
    elsif outside_parameters?(ending) || friendly_fire?(starting, ending)
      raise MoveError.new("What are you doing!")
    elsif !piece.moves.include?([row2, col2])
      raise MoveError.new("That is not a valid move for the piece!")
    end
  end

  def execute_move(starting, ending)
    row1, col1 = starting
    row2, col2 = ending
    piece = @grid[row1][col1]
    @grid[row2][col2] = piece
    piece.position = [row2, col2]
    @grid[row1][col1] = nil 
  end

  def lose?(color)
    pieces(color).each do |piece|
      piece.moves.each do |move|
        if piece.still_check?(piece.position, move, color) == false
         return false
        end
      end
    end
    true
  end

  def other_team(color)
    color == :Black ? :White : :Black
  end

  def check?(color)
    #if any of the other teams pieces moves include your kind you are in check
    pieces(other_team(color)).any? { |x| x.moves.include?(find_king(color)) }
  end

  def pieces(team_color)
     self.grid.flatten.select { |pos| !pos.nil? && pos.color == team_color }
  end
  
  def find_king(color)
    pieces(color).select { |x| x.class == King }.first.position
  end

  def friendly_fire?(starting, ending)
    row1, col1 = starting
    row2, col2 = ending
    return false if @grid[row2][col2].nil?
    unless @grid[row1][col1].color == @grid[row2][col2].color
      false
    else
      true
    end
  end

  def outside_parameters?(ending)
    ending.any? { |pos| pos < 0 || pos > 7 }
  end

    
  def build_board
    @grid = Array.new(8) { Array.new(8) }
    build_pawns
    build_not_pawn(King, @kings, [0,4],[7,4])
    build_not_pawn(Bishop, @bishops, [0,2],[7,2])
    build_not_pawn(Bishop, @bishops, [0,5],[7,5])
    build_not_pawn(Rook, @rooks, [0,0], [7,0])
    build_not_pawn(Rook, @rooks, [0,7], [7,7])
    build_not_pawn(Knight, @knights, [0,1], [7,1])
    build_not_pawn(Knight, @knights, [0, 6], [7,6])
    build_not_pawn(Queen, @queens, [0,3], [7,3])
  end
  
  def build_not_pawn(piece, name, black, white)
    @grid.each.with_index do |row, idx1|
      row.each.with_index do |pos, idx2|
        if idx1 == black[0] && idx2 == black[1]
          @grid[idx1][idx2] = piece.new(black, name[0], :Black, self)
        elsif idx1 == white[0] && idx2 == white[1]
          @grid[idx1][idx2] = piece.new(white, name[1], :White, self)
        end
      end
    end
  end

  def build_pawns
    @grid.each.with_index do |row, idx1|
      row.each.with_index do |pos, idx2|
        if idx1 == 1
          @grid[idx1][idx2] = Pawn.new([idx1, idx2], @pawns[0], :Black, self)
        elsif idx1 == 6
          @grid[idx1][idx2] = Pawn.new([idx1, idx2], @pawns[1], :White, self)
        end
      end
    end
  end
end
