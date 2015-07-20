require "ishi/ast/list"

module Ishi
  module AST
    class StmtList < List
      def initialize(_children)
        super
      end

      def to_s
        @children.map(&:to_s).join("\n")
      end
    end
  end
end
