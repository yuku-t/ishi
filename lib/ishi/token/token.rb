module Ishi
  module Token
    class Token
      attr_reader :line_number
      attr_reader :value

      # @param line_number [Fixnum]
      # @param value [Object, nil]
      def initialize(line_number, value = nil)
        @line_number = line_number
        @value = value
      end
    end
  end
end
