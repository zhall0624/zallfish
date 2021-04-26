module Zallfish
  module Pieces
    class Rook < Piece
      def moves
        [:up, :down, :left, :right].reduce([]) { |moves, direction| moves + direction_moves(direction) }
      end

      private

      def black_unicode
        "\u{265C}"
      end

      def white_unicode
        "\u{2656}"
      end
    end
  end
end