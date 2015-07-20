require "ishi/ast/binary_expr"

module Ishi
  module AST
    class GtOp < BinaryExpr
      def operator
        ">"
      end
    end
  end
end
