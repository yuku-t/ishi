require "ishi/ast/list"

module Ishi
  module AST
    class StmtList < List
      def eval(env)
        @children.each { |child| child.eval(env) }
      end

      def to_s
        @children.map(&:to_s).join("\n")
      end
    end
  end
end
