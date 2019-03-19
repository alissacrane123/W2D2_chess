require_relative "piece"
require "singleton"
require "colorize"

class NullPiece < Piece
  include Singleton
  def initialize 

  end
end