describe Zallfish::Pieces::Knight do
  let(:board) { Zallfish::Board.new }
  let(:square) { board.squares['a'][4] }
  let(:knight) { Zallfish::Pieces::Knight.new(color: Zallfish::Pieces::WHITE, board: board) }

  before(:each) do
    knight.square = square
    square.piece = knight
  end

  describe "#moves" do
    it 'should have valid moves' do
      expected = [
        board.squares['b'][2],
        board.squares['c'][3],
        board.squares['c'][5],
        board.squares['b'][6]
      ]
      expect(knight.moves).to match_array(expected)
    end
  end

  describe "#move" do
    it 'should move to valid square' do
      new_square = board.squares['b'][2]
      knight.move(new_square)
      expect(square.piece).to be_nil
      expect(knight.square).to eq(new_square)
      expect(new_square.piece).to eq(knight)
    end

    it 'should not move to invalid square' do
      expect { knight.move(board.squares['c'][4]) }.to raise_error(Zallfish::Error)
    end
  end
end
