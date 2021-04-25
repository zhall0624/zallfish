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

      def direction_moves(direction)
        [].tap do |moves|
          current_square = square
          while (current_square = square_in_direction(direction, current_square))
            moves << current_square
          end
        end
      end

      def square_in_direction(direction, current_square)
        case direction
        when :up
          board.next_file_square(current_square)
        when :down
          board.prev_file_square(current_square)
        when :left
          board.next_rank_square(current_square)
        when :right
          board.prev_rank_square(current_square)
        when :up_right
          board.next_right_diagonal_square(current_square)
        when :down_left
          board.prev_right_diagonal_square(current_square)
        when :up_left
          board.next_left_diagonal_square(current_square)
        when :down_right
          board.prev_left_diagonal_square(current_square)
        end
      end
    end
  end
end