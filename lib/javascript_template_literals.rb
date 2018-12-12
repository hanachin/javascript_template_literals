require "javascript_template_literals/version"
require "binding_of_caller"

module JavascriptTemplateLiterals
  class Error < StandardError; end

  refine(Object) do
    def `(str)
      b = binding.of_caller(1)
      str.gsub(/\$\{([^\}]*)\}/) { b.eval($1) }
    end
  end
end
