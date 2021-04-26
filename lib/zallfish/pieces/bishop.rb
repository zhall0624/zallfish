module Zallfish
  module Pieces
    class Bishop < Piece
      def moves
        [:up_right, :down_left, :up_left, :down_right].reduce([]) { |moves, direction| moves + direction_moves(direction) }
      end

      private

      def white_unicode
        "\u{2657}"
      end

      def black_unicode
        "\u{265D}"
      end
    end
  end
end