require "ishi/ast/binary_expr"

module Ishi
  module AST
    class LetOp < BinaryExpr
      def operator
        "<="
      end
    end
  end
end
