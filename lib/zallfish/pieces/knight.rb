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

      def to_s
        'N'
      end
    end
  end
end