module Zallfish
  class Board
    FILES = ('a'..'h').to_a
    RANKS = (1..8).to_a

    attr_reader :squares

    def initialize
      @squares = generate_squares
    end

    private

    def generate_squares
      (Hash.new { |hash, key| hash[key] = {} }).tap do |squares|
        FILES.each do |file|
          RANKS.each do |rank|
            squares[file][rank] = Square.new(file: file, rank: rank)
          end
        end
      end
    end
  end
end