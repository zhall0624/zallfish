module Zallfish
  module Pieces
    class Pawn < Piece
      def initialize(color:, board: nil, square: nil)
        super
        @has_moved = false
      end

      def moves
        valid_moves = [board.squares[square.file][square.rank + 1]]
        valid_moves += [board.squares[square.file][square.rank + 2]] unless moved?

        valid_moves
      end

      def move(new_square)
        raise Zallfish::Error unless moves.include?(new_square)

        square.piece = nil
        self.square = new_square
        square.piece = self

        @has_moved = true
      end

      private

      def moved?
        @has_moved
      end

      def capture_moves

      end
    end
  end
end