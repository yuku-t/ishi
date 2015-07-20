require "strscan"
require "ishi/error"
require "ishi/token"

module Ishi
  class Lexer
    NUMBER = :NUMBER
    IDENTIFIER = :IDENTIFIER

    RULES = [
      {
        regexp: %r{\+|-|/|\*|[[:punct:]]}
      },
      {
        regexp: /\d+/,
        symbol: NUMBER,
      }
    ].freeze

    SPACES = /\s*/

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
        scanner.scan(SPACES)

        @queue << catch(:token) do
          RULES.each do |rule|
            if (string = scanner.scan(rule[:regexp]))
              token_symbol = rule[:symbol] || string
              throw :token, [token_symbol, Token.new(string, line_number, scanner.pos)]
            end
          end
          fail ParseError, "bad token at line #{line_number}" unless scanner.eos?
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
