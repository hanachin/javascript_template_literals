using JavascriptTemplateLiterals

RSpec.describe JavascriptTemplateLiterals do
  it "interpolate expression" do
    a = 5
    b = 10
    expect {
puts(`Fifteen is ${a + b} and
not ${2 * a + b}.`)
    }.to output(<<~EOS).to_stdout
    Fifteen is 15 and
    not 20.
    EOS
  end
end
