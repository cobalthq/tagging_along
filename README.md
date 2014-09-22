# TaggingAlong

Super lightweight alternative to all the other tagging gems out there.

## Installation

Add this line to your application's Gemfile:

    gem 'tagging_along'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tagging_along

## Usage

Include the gem in the model you want to use it with:

```ruby
class User
  include TaggingAlong
end
```

and define the attributes that are taggable inside the class:

```ruby
class User
  include TaggingAlong
  attr_accessor :cars

  is_taggable_on :cars
end
```

Instances of your class will now have taggable attributes. For example:

```ruby
user = User.new
user.cars = 'Audi,BMW'

user.cars_tags
# => ['Audi', 'BMW']

user.cars_list
# => 'Audi, BMW'
```

You can also specify a custom separator:

```ruby
class User
  include TaggingAlong
  attr_accessor :cars

  is_taggable_on :cars, separator: ':'
end
```

which will play out like this:

```ruby
user = User.new
user.cars = 'Audi:BMW'

user.cars_tags
# => ['Audi', 'BMW']

user.cars_list
# => 'Audi: BMW'
```

You can define multiple taggable attributes in one go:

```ruby
class User
  include TaggingAlong
  attr_accessor :cars, :qualifications

  is_taggable_on :cars, :qualifications
end
```

That's it!

## Contributing

1. Fork it ( https://github.com/CrowdCurity/tagging_along/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
