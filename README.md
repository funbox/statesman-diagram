# Statesman State Diagram

[![Gem Version](https://img.shields.io/gem/v/statesman-diagram.svg)](https://rubygems.org/gems/statesman-diagram)
[![Travis CI](https://img.shields.io/travis/com/funbox/statesman-diagram)](https://travis-ci.com/github/funbox/statesman-diagram)
[![Coveralls](https://img.shields.io/coveralls/funbox/statesman-diagram.svg)](https://coveralls.io/github/funbox/statesman-diagram)

Extension of [Statesman](https://rubygems.org/gems/statesman) to get state diagrams.

Adds `.to_dot` method to `Statesman::Machine`. It can export your machine
class definition to the
[DOT](https://en.wikipedia.org/wiki/DOT_%28graph_description_language%29) format.

Also adds a Rake task called `statesman:diagram`. It runs the `dot`
program (GraphViz) to make a PNG image from the DOT representation of the
machine class.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'statesman-diagram'
end
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install statesman-diagram
```

## Prerequisites

* GraphViz (the `dot` program):
  * `brew install graphviz` on macOS.
  * `sudo apt-get install graphviz` on Ubuntu / Debian.

## Usage

Run:

```
rake statesman:diagram[My::State::Machine::Class]
```

Find the state diagram of this class in `My_State_Machine_Class.png`.

You can also specify the name of the file:

```
rake statesman:diagram[My::State::Machine::Class, ./temp/state]
```

And the state diagram of this class will be placed in `./temp/state.png`.

## Development

After checking out the repo, run `bin/setup` to install dependencies.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`,
which will create a git tag for the version, push git commits and tags,
and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/funbox/statesman-diagram.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[![Sponsored by FunBox](https://funbox.ru/badges/sponsored_by_funbox_centered.svg)](https://funbox.ru)
