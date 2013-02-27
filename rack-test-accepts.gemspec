# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/test/accepts/version'

Gem::Specification.new do |gem|
  gem.name          = "rack-test-accepts"
  gem.version       = Rack::Test::Accepts::VERSION
  gem.authors       = ["Iain Barnett"]
  gem.email         = ["iainspeed@gmail.com"]
  gem.description   = %q{Helpers for rack-test that mean I don't need to remember the accept header syntax, or whether to prepend HTTP to them.}
  gem.summary       = %q{Helpers for rack-test for the HTTP_ACCEPT header.}
  gem.homepage      = "https://github.com/yb66/rack-test-accepts"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency("rack")
end
