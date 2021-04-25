module Zallfish
  module Pieces
    class Piece
      attr_accessor :color, :board, :square

      def initialize(color:, board: nil, square: nil)
        @board = board
        @square = square
        @color = color
        @has_moved = false
      end

      def move(new_square)
        raise Zallfish::Error unless moves.include?(new_square)
        @has_moved = true
        square.piece = nil
        self.square = new_square
        square.piece = self
      end

      private

      def moved?
        @has_moved
      end
    end
  end
end