lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "ishi"

Gem::Specification.new do |spec|
  spec.name        = "ishi"
  spec.version     = Ishi::VERSION
  spec.authors     = ["Yuku Takahashi"]
  spec.email       = ["taka84u9@gmail.com"]
  spec.summary     = "Yet another Stone language implementation"
  spec.description = "Yet another Stone language implementation written in Ruby."
  spec.license     = "MIT"

  spec.files       = `git ls-files -z`.split("\x0")
  spec.homepage    = "https://github.com/yuku-t/ishi"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "yard", "~> 0.8"
  spec.add_development_dependency "guard", "~> 2.12"
  spec.add_development_dependency "guard-livereload", "~> 2.4"
  spec.add_development_dependency "guard-yard", "~> 2.1"
end
