module Zallfish
  class FENParser
    attr_accessor :board

    def initialize
      @board = Board.new
    end

    def parse(fen_string)
      piece_postions, active_color, castling_rights, en_passant_target, half_move, full_move =
        fen_string.split(' ')
      parse_piece_positions(piece_postions)
    end

    def parse_piece_positions(piece_postions)
      current_square = board.squares['a'][8]

      piece_postions.each_char do |char|
        next current_square = board.squares['a'][current_square.rank - 1] if char == '/'

        if m = char.match(/\d/)
          empty_squares = m[0].to_i
          next_square = board.squares[(current_square.file.ord + empty_squares).chr][current_square.rank]
          current_square = next_square unless next_square.nil?
          next
        end
        piece = parse_piece(char)
        current_square.piece = piece
        piece.square = current_square
        next_square = board.next_rank_square(current_square)
        current_square = next_square unless next_square.nil?
      end
    end

    def parse_piece(char)
      case char
      when 'K'
        Pieces::King.new(color: Pieces::WHITE, board: board)
      when 'k'
        Pieces::King.new(color: Pieces::BLACK, board: board)
      when 'Q'
        Pieces::Queen.new(color: Pieces::WHITE, board: board)
      when 'q'
        Pieces::Queen.new(color: Pieces::BLACK, board: board)
      when 'B'
        Pieces::Bishop.new(color: Pieces::WHITE, board: board)
      when 'b'
        Pieces::Bishop.new(color: Pieces::BLACK, board: board)
      when 'N'
        Pieces::Knight.new(color: Pieces::WHITE, board: board)
      when 'n'
        Pieces::Knight.new(color: Pieces::BLACK, board: board)
      when 'R'
        Pieces::Rook.new(color: Pieces::WHITE, board: board)
      when 'r'
        Pieces::Rook.new(color: Pieces::BLACK, board: board)
      when 'P'
        Pieces::Pawn.new(color: Pieces::WHITE, board: @board)
      when 'p'
        Pieces::Pawn.new(color: Pieces::BLACK, board: @board)
      end
    end
  end
end