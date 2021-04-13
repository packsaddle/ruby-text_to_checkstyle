# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'text_to_checkstyle/version'

Gem::Specification.new do |spec|
  spec.name          = 'text_to_checkstyle'
  spec.version       = TextToCheckstyle::VERSION
  spec.authors       = ['sanemat']
  spec.email         = ['o.gata.ken@gmail.com']

  spec.summary       = 'Transform text format to checkstyle format.'
  spec.description   = 'Transform text format to checkstyle format.'
  spec.homepage      = 'https://github.com/packsaddle/ruby-text_to_checkstyle'
  spec.license       = 'MIT'

  spec.files         = \
    `git ls-files -z`
      .split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
      .reject do |f|
        [
          '.travis.yml',
          'circle.yml',
          '.tachikoma.yml',
          'package.json'
        ].include?(f)
      end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_runtime_dependency 'thor', '>= 0'
  spec.add_runtime_dependency 'rexml', '>= 0'

  spec.add_development_dependency 'bundler', '>= 0'
  spec.add_development_dependency 'rake', '>= 0'
  spec.add_development_dependency 'test-unit', '>= 0'
end
