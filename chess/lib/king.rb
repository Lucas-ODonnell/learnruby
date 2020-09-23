require_relative 'jumping_pieces'
class King < JumpingPieces
  def move_directions
    { n: [-1,0],
      s: [1,0],
      e: [0,1],
      w: [0,-1],
      ne: [-1,1],
      nw: [-1,-1],
      se: [1,1],
      sw: [1,-1]
    }
  end
end
  
  
