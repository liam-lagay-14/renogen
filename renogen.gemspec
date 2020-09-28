# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'renogen/version'

Gem::Specification.new do |s|
  s.name        = 'renogen'
  s.version     = Renogen::VERSION
  s.date        = '2020-07-10'
  s.summary     = 'Release Notes/changelog Generator'
  s.description = 'A tool to separate product feature release notes from the product versions.'
  s.authors     = 'Dave Elliott'
  s.email       = 'ddazza@gmail.com'
  s.files       = Dir.glob('{bin,lib,spec}/**/**/**') + %w(README.md LICENSE)
  s.homepage    = 'https://github.com/DDAZZA/renogen'
  s.license     = 'GPL-3.0'
  s.executables << 'renogen'
  s.required_ruby_version = '~> 2.0'

  # Required development dependencies
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_dependency 'pry'
  s.add_dependency 'pry-byebug'
end
