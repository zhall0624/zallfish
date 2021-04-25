module Zallfish
  module Pieces
    class Bishop < Piece
      def moves
        [:up_right, :down_left, :up_left, :down_right].reduce([]) { |moves, direction| moves + direction_moves(direction) }
      end

      private

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