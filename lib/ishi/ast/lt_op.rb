require "ishi/ast/binary_expr"

module Ishi
  module AST
    class LtOp < BinaryExpr
      def operator
        "<"
      end
    end
  end
end
