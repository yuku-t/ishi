require "ishi/ast/node"

module Ishi
  module AST
    class Leaf
      include Node

      # @param token [Ishi::Token]
      def initialize(token)
        @token = token
      end

      def children
        []
      end

      def location
        "at line #{@token.line_number}"
      end
    end
  end
end
