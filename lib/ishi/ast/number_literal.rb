require "ishi/ast/leaf"

module Ishi
  module AST
    class NumberLiteral < Leaf
      def value
        @token.value.to_i
      end

      def to_s
        @token.value
      end
    end
  end
end
