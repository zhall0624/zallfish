module Zallfish
  module Pieces
    class Knight < Piece
      def moves
        [
          board.squares[(square.file.ord + 2).chr][square.rank + 1],
          board.squares[(square.file.ord + 2).chr][square.rank - 1],
          board.squares[(square.file.ord - 2).chr][square.rank + 1],
          board.squares[(square.file.ord - 2).chr][square.rank - 1],
          board.squares[(square.file.ord + 1).chr][square.rank + 2],
          board.squares[(square.file.ord + 1).chr][square.rank - 2],
          board.squares[(square.file.ord - 1).chr][square.rank + 2],
          board.squares[(square.file.ord - 1).chr][square.rank - 2],
        ].compact
      end

      private

      def black_unicode
        "\u{265E}"
      end

      def white_unicode
        "\u{2658}"
      end
    end
  end
end