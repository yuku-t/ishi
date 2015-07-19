require "strscan"
require "ishi/error"
require "ishi/token"

module Ishi
  class Lexer
    NUMBER = :NUMBER

    REGEXP = {
      NUMBER => /\d+/,
      OPERATOR: %r{\+|-|/|\*},
      SPACES: /\s*/,
    }.freeze

    def initialize(readable)
      @readable = readable
      @queue = []
    end

    def next_token
      readline if @queue.empty?
      @queue.shift
    end

    private

    def readline
      line = @readable.readline
      line_number = @readable.lineno
      scanner = StringScanner.new(line)

      until scanner.eos?
        scanner.scan(REGEXP[:SPACES])

        if (operator = scanner.scan(REGEXP[:OPERATOR]))
          @queue << [operator, Token.create_operator(line_number, operator)]
        elsif (number = scanner.scan(REGEXP[NUMBER]))
          @queue << [NUMBER, Token.create_number(line_number, number)]
        elsif !scanner.eos?
          fail ParseError, "bad token at line #{line_number}"
        end
      end

      if @readable.eof?
        @queue << [false, nil]
      else
        fail ParseError, "bad token at line #{line_number}"
      end
    end
  end
end
