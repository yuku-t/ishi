module Ishi
  # Base class for all exceptions.
  class Error < StandardError
  end

  class ParseError < Error
  end
end
