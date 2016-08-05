# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'after_notifier/version'

Gem::Specification.new do |spec|
  spec.name          = "after_notifier"
  spec.version       = AfterNotifier::VERSION
  spec.authors       = ["Yuji Takaesu"]
  spec.email         = ["taka.esu.user@gmail.com"]
  spec.summary       = 'Notify the end of launched process.'
  spec.description   = 'You must wait launched process long long time. then, this command can notify you after launched'
  spec.homepage      = "https://github.com/yusabana/after_notifier"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "terminal-notifier", "~> 1.6.3"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-doc"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "awesome_print"
end
