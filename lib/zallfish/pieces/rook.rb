module Zallfish
  module Pieces
    class Rook < Piece
      def moves
        [:up, :down, :left, :right].reduce([]) { |moves, direction| moves + direction_moves(direction) }
      end
    end
  end
end