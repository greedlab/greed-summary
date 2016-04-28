# Greed::Summary

generate `SUMMARY.md` for Github or Gitbook

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'greed-summary'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install greed-summary

## Usage

```
greed-summary [OPTION]

-t, --title [string]:
   title ,default 'SUMMARY'

-d, --directory [directory path]:
   target directory path ,default './'

-o, --output [file path]:
   output file path ,default './SUMMARY.md'

-i, --ignore [array]:
   ignore string array ,default '['resource', 'Resource']'

-s, --suffix [array]:
   suffix string array ,default '['.md', '.markdown']'

-S, --style [string]:
   output style ,could be 'github' or 'gitbook', default 'github'

-a, --autotitle:
   auto set title through file content

-e, --encode:
   url encode

-h, --help:
   show help

-v, --version:
   show version
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/greedlab/greed-summary.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

