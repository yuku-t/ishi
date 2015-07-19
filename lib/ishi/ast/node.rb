module Ishi
  module AST
    module Node
      # @return [Array<Node>]
      def children
        fail NotImplementedError
      end

      # @return [Fixnum]
      def num_children
        children.size
      end

      # @return [String]
      def location
        fail NotImplementedError
      end
    end
  end
end
