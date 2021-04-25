module Zallfish
  class Board
    FILES = ('a'..'h').to_a
    RANKS = (1..8).to_a

    attr_reader :squares

    def initialize
      @squares = generate_squares
    end

    def next_file_square(square)
      squares[square.file][square.rank + 1]
    end

    def prev_file_square(square)
      squares[square.file][square.rank - 1]
    end

    def next_rank_square(square)
      squares[(square.file.ord + 1).chr][square.rank]
    end

    def prev_rank_square(square)
      squares[(square.file.ord - 1).chr][square.rank]
    end

    def next_right_diagonal_square(square)
      squares[(square.file.ord + 1).chr][square.rank + 1]
    end

    def prev_right_diagonal_square(square)
      squares[(square.file.ord - 1).chr][square.rank - 1]
    end

    def next_left_diagonal_square(square)
      squares[(square.file.ord - 1).chr][square.rank + 1]
    end

    def prev_left_diagonal_square(square)
      squares[(square.file.ord + 1).chr][square.rank - 1]
    end

    private

    def generate_squares
      (Hash.new { |hash, key| hash[key] = {} }).tap do |squares|
        FILES.each do |file|
          RANKS.each do |rank|
            squares[file][rank] = Square.new(file: file, rank: rank)
          end
        end
      end
    end
  end
end