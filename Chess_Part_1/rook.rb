require_relative "slideable_mod"
require_relative "piece"

class Rook < Piece
  include Slideable

  def moves
    [[0,1],[0,-1],[1,0],[-1,0]]
  end 

end