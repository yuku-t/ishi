require "ishi/ast/binary_expr"

module Ishi
  module AST
    class DivOp < BinaryExpr
      def operator
        "/"
      end
    end
  end
end
