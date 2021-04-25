describe Zallfish::Pieces::Rook do
  let(:board) { Zallfish::Board.new }
  let(:square) { board.squares['b'][2] }
  let(:rook) { Zallfish::Pieces::Rook.new(color: Zallfish::Pieces::WHITE, board: board) }

  before(:each) do
    rook.square = square
    square.piece = rook
  end

  describe "#moves" do
    it 'should move along a file' do
      expected = (1..8).map { |rank| board.squares['b'][rank] }
      expected.delete(square)
      expect(rook.moves).to include(*expected)
    end

    it 'should move along a rank' do
      expected = ('a'..'h').map { |file| board.squares[file][2] }
      expected.delete(square)
      expect(rook.moves).to include(*expected)
    end

    it 'should not include original square' do
      expect(rook.moves).not_to include(square)
    end
  end

  describe "#move" do
    it 'should move to valid square' do
      new_square = board.squares['b'][4]
      rook.move(new_square)
      expect(square.piece).to be_nil
      expect(rook.square).to eq(new_square)
      expect(new_square.piece).to eq(rook)
    end

    it 'should not move to invalid square' do
      expect { rook.move(board.squares['c'][4]) }.to raise_error(Zallfish::Error)
    end
  end
end