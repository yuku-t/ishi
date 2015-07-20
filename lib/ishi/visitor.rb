module Ishi
  # @abstract
  class Visitor
    # @param node [AST::Node]
    def visit(node)
      method_name = "visit_#{underscore(node.class.name.split("::").last)}"
      if respond_to?(method_name)
        public_send(method_name, node)
      else
        fail NotImplementedError, method_name
      end
    end

    def underscore(camel_cased_word)
      word = camel_cased_word.to_s
      word.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      word.gsub!(/([a-z])([A-Z])/, '\1_\2')
      word.downcase
    end
  end
end
