require "javascript_template_literals/version"
require "binding_of_caller"

module JavaScriptTemplateLiterals
  class Error < StandardError; end

  def self.interpolate(b, str)
    str.gsub(/\$\{([^\}]*)\}/) { b.eval($1) }
  end

  def self.template_arguments(b, str)
    strings = []
    exps = []
    loop do
      h, _, str = str.partition(/\$\{([^\}]*)\}/)
      strings << h
      break unless $1
      exps << b.eval($1)
    end
    [strings, *exps]
  end

  refine(Object) do
    def `(str)
      b = binding.of_caller(1)
      JavaScriptTemplateLiterals.interpolate(b, str).tap do |ret|
        ret.define_singleton_method(:to_ary) do
          JavaScriptTemplateLiterals.template_arguments(b, str)
        end
      end
    end
  end
end
