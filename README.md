[![Build Status](https://travis-ci.org/laurentzziu/universities.svg?branch=master)](https://travis-ci.org/laurentzziu/universities)
[![Gem Version](https://badge.fury.io/rb/universities.svg)](https://rubygems.org/gems/universities)
[![Maintainability](https://api.codeclimate.com/v1/badges/06e863f836bf7faeaeb5/maintainability)](https://codeclimate.com/github/laurentzziu/universities/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/06e863f836bf7faeaeb5/test_coverage)](https://codeclimate.com/github/laurentzziu/universities/test_coverage)

# Universities

This is a Ruby gem for querying [Hipo/university-domains-list](https://github.com/Hipo/university-domains-list).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'universities'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install universities

## Usage

### Get all universities
```ruby
# returns an array with all Universities
# each element is an instance of Universities::Entity
Universities.get_all
```

### Filter
Available filters: `country`, `name`.

**Important!** In order for the filtered request to return results, you need to call `#fetch`.

#### Filter by *country*
```ruby
Universities.get.country('Romania').fetch
# alias_method:
Universities.get.by_country('Romania').fetch
```

#### Filter by *name*
```ruby
Universities.get.name('Politehnica').fetch
# alias_method:
Universities.get.by_name('Politehnica').fetch
```

#### Filter by *country* and *name*
```ruby
Universities.get.country('Romania').name('Politehnica').fetch
# alias_method:
Universities.get.by_country('Romania').by_name('Politehnica').fetch
```

#### University::Entity
Example

```ruby
#<Universities::Entity:0x00007fbd4312c408
  @alpha_two_code="RO",
  @country="Romania",
  @domains=["pub.ro"],
  @name="University Politehnica of Bucharest",
  @state_province=nil,
  @web_pages=["http://www.pub.ro/"]>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/laurentzziu/universities>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Universities project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/laurentzziu/universities/blob/master/CODE_OF_CONDUCT.md).
