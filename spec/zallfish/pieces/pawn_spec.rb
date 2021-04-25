describe Zallfish::Pieces::Pawn do
  let(:board) { Zallfish::Board.new }
  let(:square) { board.squares['c'][2] }
  let(:pawn) { Zallfish::Pieces::Pawn.new(color: Zallfish::Pieces::WHITE, board: board, square: square) }

  describe "#moves" do
    it 'should move one square forward' do
      square.piece = pawn
      expect(pawn.moves).to include(board.squares['c'][3])
    end

    it 'should move two squares forward if it has not moved' do
      square.piece = pawn
      expect(pawn.moves).to include(board.squares['c'][4])
    end

    it 'should not be able to move to squares if it has moved' do
      square.piece = pawn
      pawn.move(board.squares['c'][3])
      expect(pawn.moves).not_to include(board.squares['c'][5])
    end

    it 'should move diagonal one square forward left if it can capture' do
      enemy_square = board.squares['b'][3]
      black_pawn = Zallfish::Pieces::Pawn.new(color: Zallfish::Pieces::BLACK, board: board, square: enemy_square)
      enemy_square.piece = black_pawn

      expect(pawn.moves).to include(board.squares['b'][3])
    end

    it 'should not move diagonal one square forward left if there is no piece' do
      expect(pawn.moves).not_to include(board.squares['b'][3])
    end

    it 'should not move diagonal one square forward left if there is a freindly piece' do
      friendly_square = board.squares['b'][3]
      white_pawn = Zallfish::Pieces::Pawn.new(color: Zallfish::Pieces::WHITE, board: board, square: friendly_square)
      friendly_square.piece = white_pawn

      expect(pawn.moves).not_to include(board.squares['b'][3])
    end

    it 'should move diagonal one square forward right if it can capture' do
      enemy_square = board.squares['d'][3]
      black_pawn = Zallfish::Pieces::Pawn.new(color: Zallfish::Pieces::BLACK, board: board, square: enemy_square)
      enemy_square.piece = black_pawn

      expect(pawn.moves).to include(board.squares['d'][3])
    end

    it 'should not move diagonal one square forward right if there is no piece' do
      expect(pawn.moves).not_to include(board.squares['d'][3])
    end

    it 'should not move diagonal one square forward right if there is a freindly piece' do
      friendly_square = board.squares['d'][3]
      white_pawn = Zallfish::Pieces::Pawn.new(color: Zallfish::Pieces::WHITE, board: board, square: friendly_square)
      friendly_square.piece = white_pawn

      expect(pawn.moves).not_to include(board.squares['d'][3])
    end
  end

  describe '#move' do
    it 'should be able to move to a valid square' do
      square.piece = pawn
      pawn.move(board.squares['c'][3])
      expect(pawn.square).to eq(board.squares['c'][3])
      expect(board.squares['c'][3].piece).to eq(pawn)
      expect(board.squares['c'][2].piece).to be_nil
    end

    it 'should raise an error if the square is invalid' do
      square.piece = pawn
      expect { pawn.move(board.squares['c'][5]) }.to raise_error(Zallfish::Error)
    end
  end
end