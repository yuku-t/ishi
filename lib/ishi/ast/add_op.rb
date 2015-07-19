require "ishi/ast/binary_expr"

module Ishi
  module AST
    class AddOp < BinaryExpr
      def operator
        "+"
      end
    end
  end
end
