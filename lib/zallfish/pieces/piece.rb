module Zallfish
  module Pieces
    class Piece
      attr_accessor :color, :board, :square

      def initialize(color:, board: nil, square: nil)
        @board = board
        @square = square
      end
    end
  end
end