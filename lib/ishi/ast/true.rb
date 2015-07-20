require "ishi/ast/leaf"
require "ishi/const"

module Ishi
  module AST
    class True < Leaf
      def value
        Const::TRUE
      end

      def to_s
        "true"
      end
    end
  end
end
