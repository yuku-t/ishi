require "ishi/ast/node"

module Ishi
  module AST
    class Leaf
      include Node

      # @param token [Ishi::Token]
      def initialize(token)
        @children = []
        @token = token
      end

      def location
        "at line #{@token.line_number}"
      end
    end
  end
end
