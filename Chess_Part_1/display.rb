require_relative "board"
require_relative "cursor"
require "colorize"

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0],board)
    @board = board
  end 

  def play
    new_pos = @cursor.get_input
    render(new_pos)
    puts
    until new_pos == nil
      new_pos = @cursor.get_input
      render(new_pos)
      puts
    end
  end 

  def render(new_pos) 
    system("clear")
    (0..7).each do |i|
      (0..7).each do |j|
        square = @board[[i,j]].to_s
        if [i,j] == new_pos
          print square.colorize(:background => :green)
        elsif [0,2,4].include?(i) 
          if [1,3,5,7].include?(j)
            print square.colorize(:color => :black, :background => :blue)
          else
            print square.colorize(:color => :black, :background => :yellow)
          end
        elsif [1,3,5].include?(i)
          if [1,3,5,7].include?(j)
            print square.colorize(:color => :black, :background => :yellow)
          else
            print square.colorize(:color => :black, :background => :blue)
          end
        elsif i == 6
          if [1,3,5,7].include?(j)
            print square.colorize(:color => :red, :background => :blue)
          else
            print square.colorize(:color => :red, :background => :yellow)
          end
        elsif i == 7
          if [1,3,5,7].include?(j)
            print square.colorize(:color => :red, :background => :yellow)
          else
            print square.colorize(:color => :red, :background => :blue)
          end
        end
      end
      puts
    end
  end
end

board = Board.new
display = Display.new(board)
display.play
