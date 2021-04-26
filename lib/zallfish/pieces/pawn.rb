module Zallfish
  module Pieces
    class Pawn < Piece
      def moves
        valid_moves = [board.next_file_square(square)]
        valid_moves << board.squares[square.file][square.rank + 2] unless moved?
        valid_moves += capture_moves
        valid_moves
      end

      private

      def capture_moves
        [board.next_left_diagonal_square(square), board.next_right_diagonal_square(square)].select { |square| enemy_piece?(square) }
      end

      def enemy_piece?(test_square)
        return false if test_square.piece.nil?
        color != test_square.piece.color
      end

      def black_unicode
        "\u{265F}"
      end

      def white_unicode
        "\u{2659}"
      end
    end
  end
end