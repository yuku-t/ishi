require "ishi/ast/binary_expr"

module Ishi
  module AST
    class SubOp < BinaryExpr
      def operator
        "-"
      end
    end
  end
end
