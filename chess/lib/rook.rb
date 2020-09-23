require_relative 'sliding_pieces'
class Rook < SlidingPieces
  def move_directions
    { n: [-1,0],
      s: [1,0],
      e: [0,1],
      w: [0,-1]
    }
  end
end
