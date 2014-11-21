# MarchHareMock

**Version: 0.0.1**

MarchHareMock is a simple mocking library for those using JRuby and the MarchHare gem for RabbitMQ messaging. Inspired by the [BunnyMock](https://github.com/midwire/bunny_mock) gem.

MarchHareMock does not cover all of the methods of MarchHare. It currently only mocks the behavior we have required for our immediate needs, which is mainly creating and binding queues and exchanges, and publishing/subscribing messages.

Feel free to fork it to add more behavior mocking and send me a pull request, just "Don't Mock the March Hare":

**Warning:** This March Hare may mock ***you***!
![Don't Mock the March Hare!](http://animals.ekstrax.com/wp-content/uploads/2014/05/Funny-Rabbit-Pictures-25.jpg "Don't Mock the March Hare!")

## Installation

Add the following to your application's Gemfile:

```ruby
group :test do
  gem 'march_hare_mock'
  # ... other gems as necessary
end
```

And then execute:

    bundle install

Or install it into your global gemspace as:

    gem install march_hare_mock

## Usage

Since this project is intended as a simple way to help test your collaboration with MarchHare/RabbitMQ, it does not really opereate as a real queue, but it _does_ support receiving messages into a queue, and reading them out. The main thing to be aware of is that the `MarchHareMock::Queue#subscribe` method does not block waiting for messages, consumes all queued messages, and returns when there are no more messages. This differs from the behavior of the real MarchHare.

See the first "integration" test case in `spec/lib/march_hare_mock_spec.rb` for a quick example of how to use MarchHareMock.

## Authors

* Chris Blackburn - https://midwire.github.io

## Contributing

1. Fork it ( https://github.com/[my-github-username]/march_hare_mock/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# License

This code is licensed under [The MIT License](http://opensource.org/licenses/MIT)
