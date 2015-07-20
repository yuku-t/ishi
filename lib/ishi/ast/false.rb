require "ishi/ast/leaf"
require "ishi/const"

module Ishi
  module AST
    class False < Leaf
      def value
        Const::FALSE
      end

      def to_s
        "false"
      end
    end
  end
end
