describe Zallfish::Board do
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

  describe "#next_file_square" do
    it "should provide next square in the file" do
      expect(board.next_file_square(board.squares['a'][2])).to eq(board.squares['a'][3])
    end

    it "should provide nil if no next square" do
      expect(board.next_file_square(board.squares['a'][8])).to be_nil
    end
  end

  describe "#prev_file_square" do
    it "should provide previous square in the file" do
      expect(board.prev_file_square(board.squares['a'][2])).to eq(board.squares['a'][1])
    end

    it "should provide nil if no prev square" do
      expect(board.prev_file_square(board.squares['a'][1])).to be_nil
    end
  end

  describe "#next_rank_square" do
    it "should provide next square in the rank" do
      expect(board.next_rank_square(board.squares['b'][2])).to eq(board.squares['c'][2])
    end

    it "should provide nil if no next square" do
      expect(board.next_rank_square(board.squares['h'][8])).to be_nil
    end
  end

  describe "#prev_rank_square" do
    it "should provide prev square in the rank" do
      expect(board.prev_rank_square(board.squares['b'][2])).to eq(board.squares['a'][2])
    end

    it "should provide nil if no prev square" do
      expect(board.prev_rank_square(board.squares['a'][8])).to be_nil
    end
  end

  describe "#next_right_diagonal_square" do
    it "should provide next square in diagonal" do
      expect(board.next_right_diagonal_square(board.squares['b'][2])).to eq(board.squares['c'][3])
    end

    it "should provide nil if no next square" do
      expect(board.next_right_diagonal_square(board.squares['h'][2])).to be_nil
    end
  end

  describe "#prev_right_diagonal_square" do
    it "should provide next square in diagonal" do
      expect(board.prev_right_diagonal_square(board.squares['b'][2])).to eq(board.squares['a'][1])
    end

    it "should provide nil if no next square" do
      expect(board.prev_right_diagonal_square(board.squares['a'][2])).to be_nil
    end
  end

  describe "#next_left_diagonal_square" do
    it "should provide next square in diagonal" do
      expect(board.next_left_diagonal_square(board.squares['b'][2])).to eq(board.squares['a'][3])
    end

    it "should provide nil if no next square" do
      expect(board.next_left_diagonal_square(board.squares['a'][8])).to be_nil
    end
  end

  describe "#prev_left_diagonal_square" do
    it "should provide next square in diagonal" do
      expect(board.prev_left_diagonal_square(board.squares['b'][2])).to eq(board.squares['c'][1])
    end

    it "should provide nil if no next square" do
      expect(board.prev_left_diagonal_square(board.squares['h'][8])).to be_nil
    end
  end
end