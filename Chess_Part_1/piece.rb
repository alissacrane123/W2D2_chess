require "colorize"

class Piece 
  def initialize(color,board,pos)
    @color = color 
    @board = board 
    @pos = pos
  end

  def to_s
    if self.is_a?(NullPiece)
      '   '
    else
      ' ♟ '
    end
  end

  def moves 
    self.moves
  end 
end

