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
include TaggingAlong
```

and define the attributes that are taggable inside the class:

```ruby
class Foo
  attr_accessor :bar

  is_taggable_on :bar
end
```

Instances of your class will now have taggable attributes. For example:

```ruby
foo = Foo.new
foo.bar = 'one,two'

foo.bar_tags
# => ['one', 'two']

foo.bar_list
# => 'one, two'
```

You can also specify a custom separator:

```ruby
class Foo
  attr_accessor :bar

  is_taggable_on :bar, separator: ':'
end
```

which will play out like this:

```ruby
foo = Foo.new
foo.bar = 'one:two'

foo.bar_tags
# => ['one', 'two']

foo.bar_list
# => 'one: two'
```

You can define multiple taggable attributes in one go:

```ruby
class Foo
  attr_accessor :bar1, :bar2

  is_taggable_on :bar, :bar2
end
```

That's it!

## Contributing

1. Fork it ( https://github.com/CrowdCurity/tagging_along/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
