module Slideable
  def horizontal_dirs
    poss_horizontal_moves = []
    pos = self.pos

    HORIZONTAL_DIRS.each do |dirs|
      new_pos = [dirs[0] + pos[0],dirs[1]+pos[1]]
      poss_horizontal_moves << new_pos if self.board.valid_pos?(new_pos)
    end
    return poss_moves
  end 
  
  def diagonal_dirs
    poss_diagonal_moves = []
    pos = self.pos
    
    DIAGONAL_DIRS.each do |dirs|
      new_pos = [dirs[0] + pos[0],dirs[1]+pos[1]]
      poss_diagonal_moves << new_pos if self.board.valid_pos?(new_pos)
    end
    return poss_moves
  end

  private 
  HORIZONTAL_DIRS = [[0,1],[0,-1],[1,0],[-1,0]]
  DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]]
end