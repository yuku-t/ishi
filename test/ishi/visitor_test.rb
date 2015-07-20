require "test_helper"

require "ishi/visitor"

class VisitorTest < MiniTest::Test
  def test_underscore
    visitor = Ishi::Visitor.new
    assert_equal("binary_expr", visitor.underscore("BinaryExpr"))
  end
end
