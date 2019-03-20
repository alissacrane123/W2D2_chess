require_relative "nullpiece"
require_relative "rook"
require_relative "bishop"
require_relative "queen"
require "colorize"
require "byebug"


class Board
  attr_accessor :rows

  def initialize 
    @rows = Array.new(8) {Array.new(8)}
    @sentinel = NullPiece.instance
    fill_board
  end

  def fill_board
    self.rows.each_with_index do |row, i|
      row.each_with_index do |square, j|
        if [0,1,6,7].include?(i)
          if [0,1].include?(i)
            row[j] = Queen.new(:black, self, [i,j])
          elsif [6,7].include?(i)
            row[j] = Queen.new(:white, self, [i,j])
          end 
        else  
          row[j] = @sentinel
        end  
      end  
    end 
  end 

  def move_piece(start_pos, end_pos)
    begin  
      current_piece = self[start_pos]
      if current_piece.is_a?(NullPiece)
        # puts "no piece at this position"
        raise UserInputError,"no piece at this position"
      else
        if self[end_pos].is_a?(NullPiece)
          self[end_pos] = current_piece
          self[start_pos] = @sentinel
        else
          # puts "this space is taken"
          raise UserInputError, "this space is taken"
        end
      end
    rescue => err
      puts err.class
    end
  end

  def [](pos)
    x,y = pos
    self.rows[x][y]
  end

  def []=(pos,val)
    x, y = pos 
    self.row[x][y] = val 
  end 

  def on_board?(new_pos)
    x, y = new_pos
    if !(0..7).include?(x) || !(0..7).include?(y)
      return false 
    end 
    true 
  end 

  def valid_pos?(start_pos,new_pos)
    # if (pos[0] >= 0 && pos[0] < 8) && (pos[1] >= 0 && pos[1] < 8)
    if self.on_board?(new_pos) && (self[new_pos].is_a?(NullPiece) || self[start_pos].color != self[new_pos].color) 
      return true
    else
      return false
    end
  end
end



class UserInputError < StandardError; end

board = Board.new
p board[[1,1]].horizontal_dirs