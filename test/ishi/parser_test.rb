require "test_helper"
require "stringio"

class ParserTest < MiniTest::Test
  def test_parse
    parser = Ishi::Parser.new

    assert_equal("(- (* 2 10) 5)", parser.parse(StringIO.new("2 * 10 - 5")).to_s)
    assert_equal("(* 2 (- 10 5))", parser.parse(StringIO.new("2 * (10 - 5)")).to_s)
    assert_equal("(* 2 (- 10 5))\n1", parser.parse(StringIO.new("2 * (10 - 5)\n1")).to_s)

    assert_equal("(= x (+ 5 6))", parser.parse(StringIO.new("x = 5 + 6")).to_s)
  end

  def test_assign_expr
    parser = Ishi::Parser.new

    assert_equal("(= x 10)\n(= y (* x 3))\n(- y 1)", parser.parse(StringIO.new(<<-EOS
      x = 10
      y = x * 3
      y - 1
    EOS
    )).to_s)
  end

  def test_comparison
    parser = Ishi::Parser.new

    assert_equal("(== (> 10 1) true)", parser.parse(StringIO.new(<<-EOS
      10 > 1 == true
    EOS
    )).to_s)
  end
end
