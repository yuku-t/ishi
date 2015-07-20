require "ishi/ast/leaf"

module Ishi
  module AST
    class Variable < Leaf
      def value
        @token.value
      end

      def to_s
        value
      end
    end
  end
end
