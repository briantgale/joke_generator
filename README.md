# Joke Generator

Joke Generator is a gem I built to demonstrate the process of building out object-oriented code with classes and inheritance. The companion tutorial notes are found in my [Tutorials Repo](https://github.com/briantgale/tutorials).


There are currently 5 branches, each representing a different state of development:

```
1 - Represents a simple script (tell_a_joke.rb) without any structure.
2 - Builds out a gem, moves the script into a module, and builds out a few methods.
3 - Creates some classes, but does not use inheritance to share methods.
4 - Adds a parent class for the jokes, demonstrates inheritance and overriding of methods.
5/master - Adds some interface methods to the main module.
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'joke_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install joke_generator

## Usage

CLI Utilities

```
./bin/console
./bin/joke
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/joke_generator.
