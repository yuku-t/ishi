require "ishi/visitor"
require "ishi/environment"

module Ishi
  class EvalVisitor < Visitor
    def initialize
      @env = Environment.new
    end

    # @param node [AST::AddOp]
    def visit_add_op(node)
      node.left.accept(self) + node.right.accept(self)
    end

    # @param node [AST::DivOp]
    def visit_div_op(node)
      node.left.accept(self) / node.right.accept(self)
    end

    # @param node [AST::MulOp]
    def visit_mul_op(node)
      node.left.accept(self) * node.right.accept(self)
    end

    # @param node [AST::SubOp]
    def visit_sub_op(node)
      node.left.accept(self) - node.right.accept(self)
    end

    # @param node [AST::AssignExpr]
    # @return assigned value
    def visit_assign_expr(node)
      @env.put(node.left.value, node.right.accept(self))
    end

    # @param node [AST::Variable]
    def visit_variable(node)
      @env.get(node.value)
    end

    # @param node [AST::AssignExpr]
    def visit_number_literal(node)
      node.value
    end

    # @param node [AST::StmtList]
    def visit_stmt_list(node)
      last_child = node.children.last
      node.children[0..-1].each do |child|
        child.accept(self)
      end
      last_child.accept(self)
    end

    # @param node [AST::GtOp]
    def visit_gt_op(node)
      node.left.accept(self) > node.right.accept(self) ? Const::TRUE : Const::FALSE
    end

    # @param node [AST::GetOp]
    def visit_get_op(node)
      node.left.accept(self) >= node.right.accept(self) ? Const::TRUE : Const::FALSE
    end

    # @param node [AST::LtOp]
    def visit_lt_op(node)
      node.left.accept(self) < node.right.accept(self) ? Const::TRUE : Const::FALSE
    end

    # @param node [AST::LetOp]
    def visit_let_op(node)
      node.left.accept(self) <= node.right.accept(self) ? Const::TRUE : Const::FALSE
    end

    # @param node [AST::EqOp]
    def visit_eq_op(node)
      node.left.accept(self) == node.right.accept(self) ? Const::TRUE : Const::FALSE
    end

    # @param node [AST::True]
    def visit_true(node)
      node.value
    end

    # @param node [AST::False]
    def visit_false(node)
      node.value
    end
  end
end
