require "test_helper"
require "stringio"

require "ishi/interpreter"
require "ishi/const"

class InterpreterTest < MiniTest::Test
  def test_assign_expr
    interpreter = Ishi::Interpreter.new

    assert_equal(29, interpreter.run(StringIO.new(<<-EOS
      y = (x = 10) * 3
      y - 1
    EOS
    )))
  end

  def test_comparison
    interpreter = Ishi::Interpreter.new

    assert_equal(Ishi::Const::FALSE, interpreter.run(StringIO.new(<<-EOS
      x = 10
      x > 5 == false
    EOS
    )))
  end
end
