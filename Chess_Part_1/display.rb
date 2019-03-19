require_relative "board"
require_relative "cursor"
require "colorize"

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0],board)
  end 

  def play
    until @cursor.get_input == nil
      new_pos = @cursor.get_input
      render(new_pos)
    end
  end

  end

  def render(pos) 
    arr = Array.new(8) {Array.new(8)}
    @cursor.board.each_with_index do |row,index|
      row.each_with_index do |row1,index1|
        if [index,index1] == pos 
          #colorize some shit
        end
      end
    end
  end
end 

