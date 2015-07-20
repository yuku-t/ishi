module Ishi
  module AST
    autoload :AddOp,         "ishi/ast/add_op"
    autoload :AssignExpr,    "ishi/ast/assign_expr"
    autoload :DivOp,         "ishi/ast/div_op"
    autoload :EqOp,          "ishi/ast/eq_op"
    autoload :False,         "ishi/ast/false"
    autoload :GetOp,         "ishi/ast/get_op"
    autoload :GtOp,          "ishi/ast/gt_op"
    autoload :LetOp,         "ishi/ast/let_op"
    autoload :LtOp,          "ishi/ast/lt_op"
    autoload :MulOp,         "ishi/ast/mul_op"
    autoload :NumberLiteral, "ishi/ast/number_literal"
    autoload :StmtList,      "ishi/ast/stmt_list"
    autoload :SubOp,         "ishi/ast/sub_op"
    autoload :True,          "ishi/ast/true"
    autoload :Variable,      "ishi/ast/variable"
  end
end
