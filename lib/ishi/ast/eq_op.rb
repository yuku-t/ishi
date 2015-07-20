require "ishi/ast/binary_expr"

module Ishi
  module AST
    class EqOp < BinaryExpr
      def operator
        "=="
      end
    end
  end
end
