require "ishi/ast/node"

module Ishi
  module AST
    class List
      include Node

      # @param children [Array<Node>]
      def initialize(children)
        @children = children
        @children.each do |child|
          child.parent = self
        end
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
