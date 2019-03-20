require_relative "slideable_mod"
require_relative "piece"

class Bishop < Piece
  include Slideable
  def moves 
    [[1,1],[1,-1],[-1,1],[-1,-1]]
  end
end