require "ishi/ast/binary_expr"

module Ishi
  module AST
    class AssignExpr < BinaryExpr
      def initialize(_children)
        super
      end

      def operator
        "="
      end
    end
  end
end
