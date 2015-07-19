require "ishi/ast/leaf"

module Ishi
  module AST
    class NumberLiteral < Leaf
      def value
        @token.value
      end

      def eval(_env)
        value
      end
    end
  end
end
