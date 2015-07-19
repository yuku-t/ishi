require "test_helper"
require "stringio"

class ParserTest < MiniTest::Test
  def test_parse
    parser = Ishi::Parser.new
    assert_kind_of(Ishi::AST::Node, parser.parse(StringIO.new("2 * 10 - 5")))
  end
end
