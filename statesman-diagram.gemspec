# coding: utf-8
$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__)).uniq!

require 'statesman/diagram/version'

Gem::Specification.new do |spec|
  spec.name          = 'statesman-diagram'
  spec.version       = Statesman::Diagram::VERSION

  spec.authors       = ['Ilya Vassilevsky',      'Andrey Lunetskas']
  spec.email         = ['vassilevsky@gmail.com', 'lunacorp@mail.ru']

  spec.summary       = 'Generates DOT representations of Statesman machines and runs dot to render them to PNGs'
  spec.homepage      = 'https://github.com/vassilevsky/statesman-diagram'
  spec.license       = 'MIT'
  spec.files         = Dir['lib/**/*.rb', 'tasks/**/*.rb', 'bin/*', '[A-Z]*']

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |file| File.basename(file) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'statesman', '~> 3.0'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
