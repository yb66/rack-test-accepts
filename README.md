# Rack::Test::Accepts

Helpers for rack-test that mean I don't need to remember the accept header syntax, or whether to prepend HTTP to them.

## Why? ##

Just to make life a bit easier.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-test-accepts'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-test-accepts

## Usage

It's easy to add this in where it's needed by including it via the RSpec config:

    RSpec.configure do |config|
      config.include Rack::Test::Accepts, :type => :request

then:

    describe "My route", :type => :request do
      let(:body) { { :key => "abcdef" }.to_json }
      before do
        post '/channel/create', body, env(:accepts_json)
      end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
