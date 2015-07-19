require "ishi/ast/node"

module Ishi
  module AST
    class List
      include Node

      # @param list [Array<Node>]
      def initialize(list)
        @children = list
      end

      def location
        if (child = @children.find(&:location))
          child.location
        else
          nil
        end
      end
    end
  end
end
