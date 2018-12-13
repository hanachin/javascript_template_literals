using JavaScriptTemplateLiterals

RSpec.describe JavaScriptTemplateLiterals do
  it "interpolate expression" do
    a = 5
    b = 10
    expect(`Fifteen is ${a + b} and
not ${2 * a + b}.
`).to eq(<<~EOS)
    Fifteen is 15 and
    not 20.
    EOS
  end

  def my_tag((strings, person_exp, age_exp))
    str0 = strings[0]
    str1 = strings[1]

    if age_exp > 99
      age_str = "centenarian"
    else
      age_str = "youngster"
    end

    `${str0}${person_exp}${str1}${age_str}`
  end

  it "pass the template literals to a tag method" do
    person = "Mike"
    age = 28
    expect(my_tag`That ${ person } is a ${ age }`).to eq("That Mike is a youngster")
  end
end
