describe Zallfish::Pieces::Bishop do
  let(:board) { Zallfish::Board.new }
  let(:square) { board.squares['b'][2] }
  let(:bishop) { Zallfish::Pieces::Bishop.new(color: Zallfish::Pieces::WHITE, board: board) }

  before(:each) do
    bishop.square = square
    square.piece = bishop
  end

  describe "#moves" do
    it 'should move along a right diagonal' do
      expected = ('a'..'h').zip(1..8).map { |file, rank| board.squares[file][rank] }
      expected.delete(square)
      expect(bishop.moves).to include(*expected)
    end

    it 'should move along a left diagonal' do
      expected = [
        board.squares['a'][3],
        board.squares['c'][1]
      ]
      expected.delete(square)
      expect(bishop.moves).to include(*expected)
    end

    it 'should not contain original square' do
      expect(bishop.moves).not_to include(square)
    end
  end

  describe "#move" do
    it 'should move to valid square' do
      new_square = board.squares['d'][4]
      bishop.move(new_square)
      expect(square.piece).to be_nil
      expect(bishop.square).to eq(new_square)
      expect(new_square.piece).to eq(bishop)
    end

    it 'should not move to invalid square' do
      expect { bishop.move(board.squares['c'][4]) }.to raise_error(Zallfish::Error)
    end
  end
end