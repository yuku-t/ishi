require "test_helper"
require "stringio"

require "ishi/interpreter"

class InterpreterTest < MiniTest::Test
  def test_assign_expr
    interpreter = Ishi::Interpreter.new

    assert_equal(29, interpreter.run(StringIO.new(<<-EOS
      x = 10
      y = x * 3
      y - 1
    EOS
    )))
  end
end
