require "ishi/ast/binary_expr"

module Ishi
  module AST
    class GetOp < BinaryExpr
      def operator
        ">="
      end
    end
  end
end
