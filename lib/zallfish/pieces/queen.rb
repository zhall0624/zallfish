module Zallfish
  module Pieces
    class Queen < Piece
      def moves
        [:up, :down, :left, :right, :up_right, :down_left, :up_left, :down_right].reduce([]) { |moves, direction| moves + direction_moves(direction) }
      end

      private

      def black_unicode
        "\u{265B}"
      end

      def white_unicode
        "\u{2655}"
      end
    end
  end
end