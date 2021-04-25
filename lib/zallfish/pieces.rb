require_relative 'pieces/piece'
require_relative 'pieces/pawn'
require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/queen'
require_relative 'pieces/knight'

module Zallfish
  module Pieces
    WHITE = :white
    BLACK = :black
    COLORS = [WHITE, BLACK]
  end
end