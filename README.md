# TextToCheckstyle

[![Gem Version](http://img.shields.io/gem/v/text_to_checkstyle.svg?style=flat)](http://badge.fury.io/rb/text_to_checkstyle)
[![Build Status](https://img.shields.io/circleci/build/github/packsaddle/ruby-text_to_checkstyle?style=flat)](https://circleci.com/gh/packsaddle/ruby-text_to_checkstyle)

## Usage

Text message to Checkstyle format.

```bash
$ echo -n "This line includes a error." | text-to-checkstyle
<?xml version='1.0'?><checkstyle><file name='path/to/file'><error column='0' line='0' message='This line includes a error.' severity='info' source='TextToCheckstyle'/></file></checkstyle>
```

## Command

```text
Commands:
  text-to-checkstyle convert         # Convert text to checkstyle
  text-to-checkstyle help [COMMAND]  # Describe available commands or one specific command
  text-to-checkstyle version         # Show the TextToCheckstyle version

Usage:
  text-to-checkstyle convert

Options:
  [--debug], [--no-debug]
  [--verbose], [--no-verbose]
  [--data=DATA]
  [--file=FILE]
  [--name=NAME]
                               # Default: path/to/file
  [--line=LINE]
                               # Default: 0
  [--column=COLUMN]
                               # Default: 0
  [--severity=SEVERITY]
                               # Default: info
  [--source=SOURCE]
                               # Default: TextToCheckstyle

Convert text to checkstyle
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'text_to_checkstyle'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install text_to_checkstyle

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec text_to_checkstyle` to use the code located in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/packsaddle/ruby-text_to_checkstyle/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
