describe Zallfish::Pieces::King do
  let(:board) { Zallfish::Board.new }
  let(:square) { board.squares['c'][4] }
  let(:king) { Zallfish::Pieces::King.new(color: Zallfish::Pieces::WHITE, board: board) }

  before(:each) do
    king.square = square
    square.piece = king
  end

  describe "#moves" do
    it 'should move 1 square in each direction' do
      expected = [
        board.squares['c'][3],
        board.squares['c'][5],
        board.squares['b'][3],
        board.squares['b'][4],
        board.squares['b'][5],
        board.squares['d'][3],
        board.squares['d'][4],
        board.squares['d'][5]
      ]
      expect(king.moves).to match_array(expected)
    end
  end

  describe "#move" do
    it 'should move to valid square' do
      new_square = board.squares['b'][4]
      king.move(new_square)
      expect(square.piece).to be_nil
      expect(king.square).to eq(new_square)
      expect(new_square.piece).to eq(king)
    end

    it 'should not move to invalid square' do
      expect { king.move(board.squares['b'][2]) }.to raise_error(Zallfish::Error)
    end
  end
end