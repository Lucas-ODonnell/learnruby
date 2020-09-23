require_relative 'piece'
class Pawn < Piece
  attr_accessor :unique_moves
  def initialize(pos, name, team, board)
    super(pos, name, team, board)
  end

  def valid_options(path)
    directions = []
    next_current = [(self.position[0] + path[0]), (self.position[1] + path[1])]
    if valid_moves(next_current)
      directions << next_current
      next_current = [(next_current[0] + path[0]), (next_current[1] + path[1])]
    end
    directions
  end
  
  def valid_moves(pos)
    row, col = pos
    return false if @board.outside_parameters?(pos) 
    if !@board.grid[row][col].nil? && @board.grid[row][col].color == self.color 
      false
    end
      true
  end


  def promotion?
    if self.color == :Black && self.position[0] == 7
      true
    elsif self.color == :White && self.position[0] == 0
      true
    end
      false
  end

  def move_directions
    @unique_moves = {} 
    get_moves
    @unique_moves
  end

  def get_moves
    black_move if self.color == :Black
    white_move if self.color == :White
    enpassante
    capture
  end

  def black_move
    if self.board.grid[(self.position[0]) + 1][self.position[1]] == nil
      @unique_moves[:down] = [1,0]
    end
  end

  def white_move
    if self.board.grid[(self.position[0])-1][self.position[1]] == nil
      @unique_moves[:up] = [-1,0]
    end
  end

  def enpassante
    return nil if self.has_move
    if self.color == :Black
      @unique_moves[:down_2] = [2,0] if self.board.grid[(self.position[0]) + 2][self.position[1]] == nil && self.board.grid[(self.position[0]) + 1][self.position[1]] == nil
    else
      @unique_moves[:up_2] = [-2,0] if self.board.grid[(self.position[0]) - 2][self.position[1]] == nil && self.board.grid[(self.position[0]) - 1][self.position[1]] == nil
    end
  end

  def capture
    black_diagonals = [[1,1], [1,-1]]
    white_diagonals = [[-1,1], [-1, -1]]
    se_pos = self.board.grid[self.position[0] + black_diagonals[0][0]][self.position[1] + black_diagonals[0][1]]
    sw_pos = self.board.grid[self.position[0] + black_diagonals[1][0]][self.position[1] + black_diagonals[1][1]]
    ne_pos = self.board.grid[self.position[0] + white_diagonals[0][0]][self.position[1] + white_diagonals[0][1]]
    nw_pos = self.board.grid[self.position[0] + white_diagonals[1][0]][self.position[1] + white_diagonals[1][1]]

    if self.color == :Black
      @unique_moves[:se] = [1,1] if !se_pos.nil? && se_pos.color == :White
      @unique_moves[:sw] = [1,-1] if !sw_pos.nil? && sw_pos.color == :White
    else
      @unique_moves[:ne] = [-1,1] if !ne_pos.nil? && ne_pos.color == :Black
      @unique_moves[:nw] = [-1,-1] if !nw_pos.nil? && nw_pos.color == :Black
    end
  end
end
