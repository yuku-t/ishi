require "test_helper"
require "stringio"

require "ishi/token"

class LexerTest < MiniTest::Test
  def test_next_token
    @lexer = Ishi::Lexer.new(StringIO.new(<<-EOS
      2 * (10 - 5)
      8 / 5
    EOS
    ))

    assert_next_token("2", symbol: Ishi::Lexer::NUMBER)
    assert_next_token("*")
    assert_next_token("(")
    assert_next_token("10", symbol: Ishi::Lexer::NUMBER)
    assert_next_token("-")
    assert_next_token("5", symbol: Ishi::Lexer::NUMBER)
    assert_next_token(")")
    assert_next_token("\\n", symbol: Ishi::Lexer::EOL)
    assert_next_token("8", symbol: Ishi::Lexer::NUMBER)
    assert_next_token("/")
    assert_next_token("5", symbol: Ishi::Lexer::NUMBER)
    assert_next_token("\\n", symbol: Ishi::Lexer::EOL)
    assert_equal([false, nil], @lexer.next_token)
  end

  private

  def assert_next_token(value, symbol: nil)
    actual_symbol, token = @lexer.next_token
    assert_equal([symbol || value, value], [actual_symbol, token ? token.value : nil])
  end
end
