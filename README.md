# BalboaArchiver

The Balboa Archiving System solves the problem of storing and retrieving digital document files that are important to you. This include bank statements, bills, job applications, and the like.

The System has a file naming convention and a directory storage convention that makes the files quick and easy to store. The ease then makes it easy to find a given file using either human browsing heuristics or file system search utilitiy.

## File Names

All files have the following naming format:

`<four-digit-year>.<two-digit-month>.<two-digit-date>.<the rest of the name>.<extention>`

Valid Names:

- 1991.05.17.StateU.MyCollegeEssay.pdf
- 2020.10.05.Savings.BankStatement.pdf
- 2003.VISA.EndOfYear.pdf

Since some file


The system recommends a "big-to-little" hierachy


## Storage Directory Tree

as well as easy to browse and search

them consistently, and then storing them in a consistent directory structure. This solves the problem of how you 



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'balboa_archiver'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install balboa_archiver

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/balboa_archiver. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/balboa_archiver/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the BalboaArchiver project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/balboa_archiver/blob/master/CODE_OF_CONDUCT.md).
