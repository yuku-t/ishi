require "strscan"
require "ishi/error"
require "ishi/token"

module Ishi
  class Lexer
    NUMBER = :NUMBER
    EOL = :EOL

    RULES = [
      {
        regexp: %r{\+|-|/|\*|[[:punct:]]|;}
      },
      {
        regexp: /\d+/,
        symbol: NUMBER,
      },
    ].freeze

    SPACES = /\s*/

    def initialize(readable)
      @readable = readable
      @queue = []
    end

    def next_token
      readline if @queue.empty? && !@readable.eof?
      @queue.shift || [false, nil]
    end

    private

    def readline
      line = @readable.readline
      line_number = @readable.lineno
      scanner = StringScanner.new(line)

      while true
        scanner.scan(SPACES)
        break if scanner.eos?

        @queue << catch(:token) do
          RULES.each do |rule|
            if (string = scanner.scan(rule[:regexp]))
              token_symbol = rule[:symbol] || string
              throw :token, [token_symbol, Token.new(string, line_number, scanner.pos)]
            end
          end
          fail ParseError, "bad token at line #{line_number}"
        end
      end

      @queue << [EOL, Token.new("\\n", line_number, scanner.pos)] if line.end_with?("\n")
    end
  end
end
