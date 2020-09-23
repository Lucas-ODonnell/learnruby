require_relative 'piece'
class SlidingPieces < Piece 
  def valid_options(path)
    directions = [] 
    next_current = [(self.position[0] + path[0]), (self.position[1] + path[1])]
    while attack_valid?(next_current)
      directions << next_current
      return directions if enemy_pos?(next_current)
      next_current = [(next_current[0] + path[0]),(next_current[1] + path[1])]
    end
    directions
  end
end
