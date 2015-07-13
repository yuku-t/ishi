require "strscan"
require "ishi/error"

module Ishi
  class Lexer
    COMMENT = :COMMENT
    NUMBER = :NUMBER
    STRING = :STRING
    IDENTIFIER = :IDENTIFIER
    EOL = :EOL

    REGEXP = {
      SPACES: /\s*/,
      COMMENT => %r{//.*},
      NUMBER => /\d+/,
      STRING => /"(?:\\"|\\\\|\\n|[^"])*"/,
      IDENTIFIER => /[a-zA-Z_]\w*|==|>=|<=|>|<|=|\(|\)|&&|\|\||[[:punct:]]/,
    }.freeze

    def initialize(readable)
      @readable = readable
      @queue = []
    end

    # @return [Array<(Symbol, String)>, Array<(false, nil)>]
    # @raise [ParseError]
    def next_token
      readline if @queue.empty? && !@readable.eof?
      @queue.shift || [false, nil]
    end

    private

    # @raise [ParseError]
    def readline
      line = @readable.readline
      scanner = StringScanner.new(line)

      until scanner.eos?
        scanner.scan(REGEXP[:SPACES])

        if (comment = scanner.scan(REGEXP[COMMENT]))
          nil
        elsif (number = scanner.scan(REGEXP[NUMBER]))
          @queue.push([NUMBER, number.to_i])
        elsif (string = scanner.scan(REGEXP[STRING]))
          @queue.push([STRING, to_string_literal(string)])
        elsif (identifier = scanner.scan(REGEXP[IDENTIFIER]))
          @queue.push([IDENTIFIER, identifier])
        elsif !scanner.eos?
          line_number = @readable.lineno
          fail ParseError, "bad token at line #{line_number}"
        end
      end

      @queue.push([EOL, "\\n"]) if line.end_with?("\n")
    end

    # @param string [String]
    # @return [String]
    def to_string_literal(string)
      string_buffer = []
      length = string.size
      after_backslash = false
      string[1...-1].each_char.with_index do |char, i|
        if after_backslash
          if char == "\\" || char == '"'
            string_buffer.push(char)
          elsif char == "n"
            string_buffer.push("\n")
          else
            string_buffer.push("\\#{char}")
          end
          after_backslash = false
        elsif char == "\\" && i <= length
          after_backslash = true
        else
          string_buffer.push(char)
        end
      end
      string_buffer.join
    end
  end
end
