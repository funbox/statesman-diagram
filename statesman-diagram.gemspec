# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "statesman-diagram"
  spec.version       = "0.1.0"
  spec.authors       = ["Ilya Vassilevsky"]
  spec.email         = ["vassilevsky@gmail.com"]

  spec.summary       = "Generates DOT representations of Statesman machines and runs dot to render them to PNGs"
  spec.homepage      = "https://github.com/vassilevsky/statesman-diagram"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "statesman", "~> 2.0"
end
