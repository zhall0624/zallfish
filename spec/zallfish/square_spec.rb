describe Zallfish::Square do
  let(:klass) { Zallfish::Square }

  describe 'valid positions' do
    Zallfish::Board::FILES.each do |file|
      Zallfish::Board::RANKS.each do |rank|
        it "#{file}#{rank} should be a valid square" do
          expect(klass.new(file: file, rank: rank)).to be_an_instance_of(klass)
        end
      end
    end
  end

  describe 'invalid positions' do
    it 'should not allow a position past 8th rank' do
      expect { klass.new(file: 'a', rank: 9) }.to raise_error(Zallfish::Error)
    end

    it 'should not allow a position before 1st rank' do
      expect { klass.new(file: 'a', rank: 0) }.to raise_error(Zallfish::Error)
    end

    it 'should not allow a position before a file' do
      expect { klass.new(file: '@', rank: 9) }.to raise_error(Zallfish::Error)
    end

    it 'should not allow a position after h file' do
      expect { klass.new(file: 'i', rank: 9) }.to raise_error(Zallfish::Error)
    end
  end

  describe '#occupied?' do
    let(:board) { Zallfish::Board.new }
    let(:unoccoupied_square) { Zallfish::Square.new(rank: 4, file: 'c') }
    let(:occoupied_square) do
      Zallfish::Square.new(rank: 2, file: 'a').tap do |square|
        square.piece = Zallfish::Pieces::Pawn.new(color: Zallfish::Pieces::WHITE, board: board, square: square)
      end
    end

    it 'should be true if occupied by a piece' do
      expect(occoupied_square.occupied?).to be_truthy
    end

    it 'should be false if unoccupied' do
      expect(unoccoupied_square.occupied?).to be_falsy
    end
  end
end