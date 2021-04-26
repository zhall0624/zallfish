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

    def initial_position
      squares['a'][1].piece = Pieces::Rook.new(board: self, square: squares['a'][1], color: Pieces::WHITE)
      squares['b'][1].piece = Pieces::Knight.new(board: self, square: squares['b'][1], color: Pieces::WHITE)
      squares['c'][1].piece = Pieces::Bishop.new(board: self, square: squares['c'][1], color: Pieces::WHITE)
      squares['d'][1].piece = Pieces::Queen.new(board: self, square: squares['d'][1], color: Pieces::WHITE)
      squares['e'][1].piece = Pieces::King.new(board: self, square: squares['e'][1], color: Pieces::WHITE)
      squares['f'][1].piece = Pieces::Bishop.new(board: self, square: squares['f'][1], color: Pieces::WHITE)
      squares['g'][1].piece = Pieces::Knight.new(board: self, square: squares['g'][1], color: Pieces::WHITE)
      squares['h'][1].piece = Pieces::Rook.new(board: self, square: squares['h'][1], color: Pieces::WHITE)
      FILES.each do |file|
        squares[file][2].piece = Pieces::Pawn.new(board: self, square: squares[file][2], color: Pieces::WHITE)
      end

      squares['a'][8].piece = Pieces::Rook.new(board: self, square: squares['a'][8], color: Pieces::BLACK)
      squares['b'][8].piece = Pieces::Knight.new(board: self, square: squares['b'][8], color: Pieces::BLACK)
      squares['c'][8].piece = Pieces::Bishop.new(board: self, square: squares['c'][8], color: Pieces::BLACK)
      squares['d'][8].piece = Pieces::Queen.new(board: self, square: squares['d'][8], color: Pieces::BLACK)
      squares['e'][8].piece = Pieces::King.new(board: self, square: squares['e'][8], color: Pieces::BLACK)
      squares['f'][8].piece = Pieces::Bishop.new(board: self, square: squares['f'][8], color: Pieces::BLACK)
      squares['g'][8].piece = Pieces::Knight.new(board: self, square: squares['g'][8], color: Pieces::BLACK)
      squares['h'][8].piece = Pieces::Rook.new(board: self, square: squares['h'][8], color: Pieces::BLACK)
      FILES.each do |file|
        squares[file][7].piece = Pieces::Pawn.new(board: self, square: squares[file][7], color: Pieces::BLACK)
      end
    end

    def to_s
      str = ""
      RANKS.each do |rank|
        FILES.each do |file|
          str << squares[file][rank].to_s
        end
        str << "\n"
      end
      str
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