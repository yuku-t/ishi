require "ishi/ast/binary_expr"

module Ishi
  module AST
    class MulOp < BinaryExpr
      def operator
        "*"
      end
    end
  end
end
