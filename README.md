# Ruripara

This gem will be all about Pripara.  
You can get Pripara data, easily.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruripara'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruripara

## Usage

```ruby
require 'ruripara'
girl = Pripara::Idol.find_by(name: '南みれぃ')
girl.cast_name
# => '芹澤優' 
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yensaki/ruripara.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
