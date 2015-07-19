require "ishi/token/op_token"
require "ishi/token/num_token"

module Ishi
  module Token
    def create_operator(line_number, value)
      OpToken.new(line_number, value)
    end
    module_function :create_operator

    def create_number(line_number, value)
      NumToken.new(line_number, value.to_i)
    end
    module_function :create_number
  end
end
