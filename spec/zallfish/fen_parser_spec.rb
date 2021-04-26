describe Zallfish::FENParser do
  let(:parser) { Zallfish::FENParser.new }
  let(:initial_board) { gen_initial_board }
  describe '#parse' do
    it 'should parse the standard starting position' do
      parser.parse("rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1")
      parser.board.squares.each do |file, squares|
        squares.each do |rank, square|
          initial_board_square = initial_board.squares[file][rank]
          expect(square.piece&.class).to eq(initial_board_square.piece&.class)
          expect(square.piece&.color).to eq(initial_board_square.piece&.color)
        end
      end
    end
  end

  def gen_initial_board
    Zallfish::Board.new.tap do |board|
      board.squares['a'][1].piece = Zallfish::Pieces::Rook.new(board: board, square: board.squares['a'][1], color: Zallfish::Pieces::WHITE)
      board.squares['b'][1].piece = Zallfish::Pieces::Knight.new(board: board, square: board.squares['b'][1], color: Zallfish::Pieces::WHITE)
      board.squares['c'][1].piece = Zallfish::Pieces::Bishop.new(board: board, square: board.squares['c'][1], color: Zallfish::Pieces::WHITE)
      board.squares['d'][1].piece = Zallfish::Pieces::Queen.new(board: board, square: board.squares['d'][1], color: Zallfish::Pieces::WHITE)
      board.squares['e'][1].piece = Zallfish::Pieces::King.new(board: board, square: board.squares['e'][1], color: Zallfish::Pieces::WHITE)
      board.squares['f'][1].piece = Zallfish::Pieces::Bishop.new(board: board, square: board.squares['f'][1], color: Zallfish::Pieces::WHITE)
      board.squares['g'][1].piece = Zallfish::Pieces::Knight.new(board: board, square: board.squares['g'][1], color: Zallfish::Pieces::WHITE)
      board.squares['h'][1].piece = Zallfish::Pieces::Rook.new(board: board, square: board.squares['h'][1], color: Zallfish::Pieces::WHITE)
      Zallfish::Board::FILES.each do |file|
        board.squares[file][2].piece = Zallfish::Pieces::Pawn.new(board: board, square: board.squares[file][2], color: Zallfish::Pieces::WHITE)
      end

      board.squares['a'][8].piece = Zallfish::Pieces::Rook.new(board: board, square: board.squares['a'][8], color: Zallfish::Pieces::BLACK)
      board.squares['b'][8].piece = Zallfish::Pieces::Knight.new(board: board, square: board.squares['b'][8], color: Zallfish::Pieces::BLACK)
      board.squares['c'][8].piece = Zallfish::Pieces::Bishop.new(board: board, square: board.squares['c'][8], color: Zallfish::Pieces::BLACK)
      board.squares['d'][8].piece = Zallfish::Pieces::Queen.new(board: board, square: board.squares['d'][8], color: Zallfish::Pieces::BLACK)
      board.squares['e'][8].piece = Zallfish::Pieces::King.new(board: board, square: board.squares['e'][8], color: Zallfish::Pieces::BLACK)
      board.squares['f'][8].piece = Zallfish::Pieces::Bishop.new(board: board, square: board.squares['f'][8], color: Zallfish::Pieces::BLACK)
      board.squares['g'][8].piece = Zallfish::Pieces::Knight.new(board: board, square: board.squares['g'][8], color: Zallfish::Pieces::BLACK)
      board.squares['h'][8].piece = Zallfish::Pieces::Rook.new(board: board, square: board.squares['h'][8], color: Zallfish::Pieces::BLACK)
      Zallfish::Board::FILES.each do |file|
        board.squares[file][7].piece = Zallfish::Pieces::Pawn.new(board: board, square: board.squares[file][7], color: Zallfish::Pieces::BLACK)
      end
    end
  end
end