require "ishi/ast/list"

module Ishi
  module AST
    class BinaryExpr < List
      # @return [Node]
      def left
        @children[0]
      end

      # @return [Node]
      def right
        @children[1]
      end
    end
  end
end
