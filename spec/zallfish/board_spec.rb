RSpec.describe Zallfish::Board do
  let(:board) { Zallfish::Board.new }

  describe "::FILES" do
    it "should have files a - h" do
      expect(Zallfish::Board::FILES).to eq(%w(a b c d e f g h))
    end
  end

  describe "::RANKS" do
    it "should have ranks 1 - 8" do
      expect(Zallfish::Board::RANKS).to eq([1, 2, 3, 4, 5, 6, 7, 8])
    end
  end

  describe "#squares" do
    it "should have 64 squares" do
      count = board.squares.reduce(0) { |total, (file, squares)| total + squares.count}
      expect(count).to eq(64)
    end
  end
end