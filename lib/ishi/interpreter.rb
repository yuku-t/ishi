require "ishi/eval_visitor"
require "ishi/parser"

module Ishi
  class Interpreter
    def initialize
      @visitor = EvalVisitor.new
      @parser = Parser.new
    end

    def run(readable)
      node = @parser.parse(readable)
      @visitor.visit(node)
    end
  end
end
