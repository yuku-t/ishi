require "test_helper"
require "stringio"

require "ishi/token"

class LexerTest < MiniTest::Test
  def test_calculation
    @lexer = Ishi::Lexer.new(StringIO.new("2 * (10 - 5)"))

    assert_next_token("2", symbol: Ishi::Lexer::NUMBER)
    assert_next_token("*")
    assert_next_token("(")
    assert_next_token("10", symbol: Ishi::Lexer::NUMBER)
    assert_next_token("-")
    assert_next_token("5", symbol: Ishi::Lexer::NUMBER)
    assert_next_token(")")

    assert_equal([false, nil], @lexer.next_token)
  end

  def test_assign_expr
    @lexer = Ishi::Lexer.new(StringIO.new(<<-EOS
      x = 9
      y = x * 2
      y - 1
    EOS
    ))

    assert_next_token("x", symbol: Ishi::Lexer::VARIABLE)
    assert_next_token("=")
    assert_next_token("9", symbol: Ishi::Lexer::NUMBER)
    assert_next_token("\\n", symbol: Ishi::Lexer::EOL)

    assert_next_token("y", symbol: Ishi::Lexer::VARIABLE)
    assert_next_token("=")
    assert_next_token("x", symbol: Ishi::Lexer::VARIABLE)
    assert_next_token("*")
    assert_next_token("2", symbol: Ishi::Lexer::NUMBER)
    assert_next_token("\\n", symbol: Ishi::Lexer::EOL)

    assert_next_token("y", symbol: Ishi::Lexer::VARIABLE)
    assert_next_token("-")
    assert_next_token("1", symbol: Ishi::Lexer::NUMBER)
    assert_next_token("\\n", symbol: Ishi::Lexer::EOL)

    assert_equal([false, nil], @lexer.next_token)
  end

  def test_keywords
    @lexer = Ishi::Lexer.new(StringIO.new("true false"))

    assert_next_token("true")
    assert_next_token("false")
    assert_equal([false, nil], @lexer.next_token)
  end

  def test_operators
    @lexer = Ishi::Lexer.new(StringIO.new("+ - * / = < > <= >= =="))

    assert_next_token("+")
    assert_next_token("-")
    assert_next_token("*")
    assert_next_token("/")
    assert_next_token("=")
    assert_next_token("<")
    assert_next_token(">")
    assert_next_token("<=")
    assert_next_token(">=")
    assert_next_token("==")
    assert_equal([false, nil], @lexer.next_token)
  end

  private

  def assert_next_token(value, symbol: nil)
    actual_symbol, token = @lexer.next_token
    assert_equal([symbol || value, value], [actual_symbol, token ? token.value : nil])
  end
end
