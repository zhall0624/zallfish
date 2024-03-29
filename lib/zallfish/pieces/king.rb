module Zallfish
  module Pieces
    class King < Piece
      def moves
        [
          board.next_file_square(square),
          board.prev_file_square(square),
          board.next_rank_square(square),
          board.prev_rank_square(square),
          board.next_right_diagonal_square(square),
          board.prev_right_diagonal_square(square),
          board.next_left_diagonal_square(square),
          board.prev_left_diagonal_square(square)
        ]
      end

      private

      def black_unicode
        "\u{265A}"
      end

      def white_unicode
        "\u{2654}"
      end
    end
  end
end