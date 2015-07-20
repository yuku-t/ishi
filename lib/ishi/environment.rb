module Ishi
  class Environment
    def initialize
      @values = {}
    end

    def get(name)
      @values[name]
    end

    def put(name, value)
      @values[name] = value
    end
  end
end
