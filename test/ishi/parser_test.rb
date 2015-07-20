require "test_helper"
require "stringio"

class ParserTest < MiniTest::Test
  def test_parse
    parser = Ishi::Parser.new

    assert_equal("(- (* 2 10) 5)", parser.parse(StringIO.new("2 * 10 - 5")).to_s)
    assert_equal("(* 2 (- 10 5))", parser.parse(StringIO.new("2 * (10 - 5)")).to_s)
    assert_equal("(* 2 (- 10 5))\n1", parser.parse(StringIO.new("2 * (10 - 5)\n1")).to_s)
  end
end
