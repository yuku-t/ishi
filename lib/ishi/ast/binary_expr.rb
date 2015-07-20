require "ishi/ast/list"

module Ishi
  module AST
    class BinaryExpr < List
      def initialize(_children)
        super
      end

      # @return [Node]
      def left
        @children[0]
      end

      # @return [Node]
      def right
        @children[1]
      end

      def to_s
        "(#{operator} #{left} #{right})"
      end
    end
  end
end
