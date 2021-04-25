module Zallfish
  module Pieces
    class Rook < Piece
      def moves
        [:up, :down, :left, :right].reduce([]) { |moves, direction| moves + direction_moves(direction) }
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
        when :up
          board.next_file_square(current_square)
        when :down
          board.prev_file_square(current_square)
        when :left
          board.next_rank_square(current_square)
        when :right
          board.prev_rank_square(current_square)
        end
      end
    end
  end
end