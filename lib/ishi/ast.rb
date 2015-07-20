module Ishi
  module AST
    autoload :AddOp,         "ishi/ast/add_op"
    autoload :AssignExpr,    "ishi/ast/assign_expr"
    autoload :DivOp,         "ishi/ast/div_op"
    autoload :MulOp,         "ishi/ast/mul_op"
    autoload :NumberLiteral, "ishi/ast/number_literal"
    autoload :StmtList,      "ishi/ast/stmt_list"
    autoload :SubOp,         "ishi/ast/sub_op"
    autoload :Variable,      "ishi/ast/variable"
  end
end
