describe Zallfish::Pieces::Queen do
  let(:board) { Zallfish::Board.new }
  let(:square) { board.squares['b'][2] }
  let(:queen) { Zallfish::Pieces::Queen.new(color: Zallfish::Pieces::WHITE, board: board) }

  before(:each) do
    queen.square = square
    square.piece = queen
  end

  describe "#moves" do
    it 'should move along a file' do
      expected = (1..8).map { |rank| board.squares['b'][rank] }
      expected.delete(square)
      expect(queen.moves).to include(*expected)
    end

    it 'should move along a rank' do
      expected = ('a'..'h').map { |file| board.squares[file][2] }
      expected.delete(square)
      expect(queen.moves).to include(*expected)
    end

    it 'should move along a right diagonal' do
      expected = ('a'..'h').zip(1..8).map { |file, rank| board.squares[file][rank] }
      expected.delete(square)
      expect(queen.moves).to include(*expected)
    end

    it 'should move along a left diagonal' do
      expected = [
        board.squares['a'][3],
        board.squares['c'][1]
      ]
      expected.delete(square)
      expect(queen.moves).to include(*expected)
    end

    it 'should not contain original square' do
      expect(queen.moves).not_to include(square)
    end
  end
end