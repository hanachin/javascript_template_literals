# JavaScriptTemplateLiterals

Make #\`(string) works like JavaScript Template literals

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'javascript_template_literals'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install javascript_template_literals

## Usage

```rb
require "javascript_template_literals"

using JavaScriptTemplateLiterals

a = 5
b = 10
puts `Fifteen is ${a + b} and
not ${2 * a + b}.`
# Fifteen is 15 and
# not 20.

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

person = "Mike"
age = 28
puts my_tag`That ${ person } is a ${ age }`
# That Mike is a youngster
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hanachin/javascript_template_literals.
