# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "activerecord_easy_type/version"

Gem::Specification.new do |spec|
  spec.name          = "activerecord_easy_type"
  spec.version       = ActiverecordEasyType::VERSION
  spec.authors       = ["haazime"]
  spec.email         = ["h4zime@gmail.com"]

  spec.summary       = %q{Easy custom type definition for ActiveRecord}
  spec.description   = %q{Easy custom type definition for ActiveRecord}
  spec.homepage      = "https://github.com/haazime/activerecord_easy_type"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
