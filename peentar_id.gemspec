# frozen-string-literal: true
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'peentar_id/version'

Gem::Specification.new do |spec|
  spec.name          = 'peentar_id'
  spec.version       = PeentarID::VERSION
  spec.authors       = ['Muhammad Mufid Afif']
  spec.description   = 'A Ruby wrapper for Peentar ID Public OAuth2.'
  spec.email         = ['mufid@peentar.com']

  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/peentar/peentar-id'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2'
  spec.add_development_dependency 'bundler', '~> 1.0'

  spec.required_ruby_version = '>=2.2.0'

end
