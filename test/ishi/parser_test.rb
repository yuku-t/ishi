require "test_helper"
require "stringio"

class ParserTest < MiniTest::Test
  def test_parse
    parser = Ishi::Parser.new
    assert_equal(15, parser.parse(StringIO.new("2 * 10 - 5")).eval({}))
    assert_equal(-48, parser.parse(StringIO.new("2 - 10 * 5")).eval({}))
    assert_equal(7, parser.parse(StringIO.new("2 + 10 - 5")).eval({}))
  end
end
