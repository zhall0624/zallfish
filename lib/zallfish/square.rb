module Zallfish
  class Square
    attr_reader :rank, :file
    attr_accessor :piece

    def initialize(rank:, file:, piece: nil)
      @rank = rank
      @file = file
      @piece = piece
      validate_rank
      validate_file
    end

    def occupied?
      !piece.nil?
    end

    def to_s
      return '[ ]' if piece.nil?
      return "[#{piece}]"
    end

    private

    def validate_rank
      raise Error unless Board::RANKS.include?(@rank)
    end

    def validate_file
      raise Error unless Board::FILES.include?(@file)
    end
  end
end