require_relative "slideable_mod"
require_relative "piece"

class Queen < Piece
  include Slideable
  
  def moves 
    [[1,1],[1,-1],[-1,1],[-1,-1],[0,1],[0,-1],[1,0],[-1,0]]
  end
end