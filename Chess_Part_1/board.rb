require_relative "nullpiece"
require "byebug"
class Board
  attr_accessor :rows

  def initialize 
    @rows = Array.new(8) {Array.new(8)}
    @sentinel = NullPiece.new()
    fill_board
  end

  def fill_board
    self.rows.each_with_index do |row, i|
      # debugger
      row.each_with_index do |square, j|
        if [0,1,6,7].include?(i)
          if [0,1].include?(i)
            # debugger
            row[j] = Piece.new(:black, self, [i,j])
          elsif [6,7].include?(i)
            row[j] = Piece.new(:white, self, [i,j])
          end 
        else  
          row[j] = NullPiece.new
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
          self[start_pos] = NullPiece.new()
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
end

class UserInputError < StandardError; end

board = Board.new
p board.move_piece([2,2],[6,7])