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
end
