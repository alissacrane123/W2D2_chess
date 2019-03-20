module Slideable
  def horizontal_dirs
    poss_moves = []
    current_pos = self.pos

    self.moves.each do |dir|
      new_pos = self.update(current_pos, dir)
      while self.board.valid_pos?(current_pos, new_pos)
        poss_moves << new_pos
        new_pos = self.update(new_pos, dir)
        
      end
    end
    return poss_moves
  end 


  def update(pos, dir)
    x, y = pos 
    dx, dy = dir 
    new_pos = [x + dx, y + dy]
    new_pos
  end 

  def diagonal_dirs
    poss_diagonal_moves = []
    pos = self.pos
    
    self.moves.each do |dirs|
      new_pos = [dirs[0] + pos[0],dirs[1]+pos[1]]
      poss_diagonal_moves << new_pos if self.board.valid_pos?(new_pos)
    end
    return poss_moves
  end

  private 
  # HORIZONTAL_DIRS = [[0,1],[0,-1],[1,0],[-1,0]]
  # DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]]
end

# poss_horizontal_moves.last == [current_x, 7] || [current_x, 0], [7, current_y], [0, current_y]