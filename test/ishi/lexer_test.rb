require "test_helper"
require "stringio"

require "ishi/token"

class LexerTest < MiniTest::Test
  def test_next_token
    @lexer = Ishi::Lexer.new(StringIO.new("2 * 10 - 5"))

    assert_next_token(Ishi::Lexer::NUMBER, 2)
    assert_next_token("*", "*")
    assert_next_token(Ishi::Lexer::NUMBER, 10)
    assert_next_token("-", "-")
    assert_next_token(Ishi::Lexer::NUMBER, 5)
    assert_equal([false, nil], @lexer.next_token)
  end

  private

  def assert_next_token(expected_symbol, expected_value)
    symbol, token = @lexer.next_token
    assert_equal(expected_symbol, symbol)
    assert_equal(expected_value, token.value)
  end
end
