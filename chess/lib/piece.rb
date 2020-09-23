class Piece
  attr_accessor :position, :has_move
  attr_reader :color, :board, :name
  def initialize(position, name, color, board)
    @position = position
    @name = name
    @color = color
    @board = board
    @has_move = false
  end

  def moves
    possible_moves = [] 
    self.move_directions.each do |k, v|
      possible_moves << valid_options(v)
    end

    possible_moves.flatten(1)
  end

  def attack_valid?(pos)
    row, col = pos
    return true  if pos == self.position
    return false if @board.outside_parameters?(pos)
    return true  if @board.grid[row][col].nil?
    return false if @board.grid[row][col].color == self.color
    return true if @board.grid[row][col].color != self.color
  end

  def enemy_pos?(pos)
    row, col = pos
    return false if @board.grid[row][col].nil?
    return true if @board.grid[row][col].color != self.color
  end

  def still_check?(starting, ending, colors_turn)
    row1, col1 = starting
    row2, col2 = ending
    checkmate = false
    piece_end = self.board.grid[row2][col2]
    piece_start = self.board.grid[row1][col1]
    #moving the piece and making the old piece empty
    self.board.grid[row2][col2] = self
    self.board.grid[row2][col2].position = ending
    self.board.grid[row1][col1] = nil
    #running the check method (other-team-piece.any?(moves.include?(find_king)
    if self.board.check?(self.color)
      checkmate = true
    end

    #resets 
    self.board.grid[row2][col2] = piece_end
    self.board.grid[row1][col1] = piece_start
    self.board.grid[row1][col1].position = starting 
    checkmate
  end

  def mark
    self.has_move = true
  end

  def promotion? 
    false
  end
end
