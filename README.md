# Taigar

[![wercker status](https://app.wercker.com/status/1e32d26108123db863a8a218d88c9652/s/master "wercker status")](https://app.wercker.com/project/byKey/1e32d26108123db863a8a218d88c9652)
[![Maintainability](https://api.codeclimate.com/v1/badges/9a38e58b060a9ed7127a/maintainability)](https://codeclimate.com/github/hirakiuc/taigar/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/9a38e58b060a9ed7127a/test_coverage)](https://codeclimate.com/github/hirakiuc/taigar/test_coverage)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/taigar`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'taigar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install taigar

## Usage

```ruby
require 'taigar'

taiga = Taigar.new
taiga.login(ENV['TAIGA_USER'], ENV['TAIGA_PASSWORD'])

project = taiga.project(slug: 'yourprj')

#  Support listing issues in the project.
type = project.issue_types.select {|issue_type| issue_type.name == 'Bug' }.first

project.issues(type: type.id, order_by: '-created_date').each do |issue|
  puts "#{issue.id}: #{issue.subject}"
end

# Support listing UserStories in the project.
project.user_stories.take(10).each do |user_story|
  puts user_story
end

# Support listing Epics in the project.
project.epics.each do |epic|
  # Support listing UserStories in the epic.
  epic.user_stories.map(&:target_user_story).each do |user_story|
    puts user_story
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/taigar.

