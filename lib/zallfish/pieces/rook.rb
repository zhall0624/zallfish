module Zallfish
  module Pieces
    class Rook < Piece
      def moves
        [:up, :down, :left, :right].reduce([]) { |moves, direction| moves + direction_moves(direction) }
      end

      def to_s
        'R'
      end
    end
  end
end