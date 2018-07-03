lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruripara/version"

Gem::Specification.new do |spec|
  spec.name          = "ruripara"
  spec.version       = Ruripara::VERSION
  spec.authors       = ["yensaki"]
  spec.email         = ["mov.an.double@gmail.com"]

  spec.summary       = "All about Pripara"
  spec.description   = "All about Pripara"
  spec.homepage      = "https://github.com/yensaki/ruripara"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "0.57.2"
end
