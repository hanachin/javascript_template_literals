require "javascript_template_literals/version"
require "binding_of_caller"

module JavascriptTemplateLiterals
  class Error < StandardError; end

  def self.interpolate(b, str)
    str.gsub(/\$\{([^\}]*)\}/) { b.eval($1) }
  end

  refine(Object) do
    def `(str)
      b = binding.of_caller(1)
      JavascriptTemplateLiterals.interpolate(b, str)
    end
  end
end
