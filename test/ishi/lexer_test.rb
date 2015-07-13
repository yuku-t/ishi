require "test_helper"
require "stringio"

class LexerText < MiniTest::Unit::TestCase
  def test_next_token
    lexer = Ishi::Lexer.new(StringIO.new(<<-EOF
      if x > 0 {
        y = "hello world"
      }
    EOF
    ))

    assert_equal([Ishi::Lexer::IDENTIFIER, "if"],      lexer.next_token)
    assert_equal([Ishi::Lexer::IDENTIFIER, "x"],       lexer.next_token)
    assert_equal([Ishi::Lexer::IDENTIFIER, ">"],       lexer.next_token)
    assert_equal([Ishi::Lexer::NUMBER, 0],             lexer.next_token)
    assert_equal([Ishi::Lexer::IDENTIFIER, "{"],       lexer.next_token)
    assert_equal([Ishi::Lexer::EOL, "\\n"],            lexer.next_token)
    assert_equal([Ishi::Lexer::IDENTIFIER, "y"],       lexer.next_token)
    assert_equal([Ishi::Lexer::IDENTIFIER, "="],       lexer.next_token)
    assert_equal([Ishi::Lexer::STRING, "hello world"], lexer.next_token)
    assert_equal([Ishi::Lexer::EOL, "\\n"],            lexer.next_token)
    assert_equal([Ishi::Lexer::IDENTIFIER, "}"],       lexer.next_token)
    assert_equal([Ishi::Lexer::EOL, "\\n"],            lexer.next_token)
    assert_equal([false, nil],                         lexer.next_token)
  end

  def test_backslash_in_string
    lexer = Ishi::Lexer.new(StringIO.new('"foo\\"bar"'))
    assert_equal([Ishi::Lexer::STRING, 'foo"bar'], lexer.next_token)
    assert_equal([false, nil],                     lexer.next_token)

    lexer = Ishi::Lexer.new(StringIO.new('"foo\\\\nbar"'))
    assert_equal([Ishi::Lexer::STRING, "foo\\nbar"], lexer.next_token)
    assert_equal([false, nil],                       lexer.next_token)
  end
end
