module Ishi
  module AST
    module Node
      # @return [List, nil]
      attr_reader :parent

      # @return [Array<Node>]
      attr_reader :children

      # @return [String]
      def to_s
        fail NotImplementedError
      end

      # @return [String]
      def location
        fail NotImplementedError
      end

      # @param visitor [Visitor]
      def accept(visitor)
        visitor.visit(self)
      end

      protected

      def parent=(parent)
        @parent = parent
      end

      # @return [Fixnum]
      def height
        @parent ? @parent.height + 1 : 0
      end
    end
  end
end
