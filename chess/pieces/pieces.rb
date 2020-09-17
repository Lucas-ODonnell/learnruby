class Pieces
  def initialize(pos,color) #array
    @pos = pos
    @color = color
    @count = 0 
  end

  def valid_position(pos)
    row, col = pos 
    return true if row.between?(0, 7) && col.between?(0,7)
    false
  end
end
