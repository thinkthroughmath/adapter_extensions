# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'adapter_extensions/version'

Gem::Specification.new do |s|
  s.name = %q{adapter_extensions}
  s.version = AdapterExtensions::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Anthony Eden", "Thibaut Barrère"]
  s.email = ["thibaut.barrere@gmail.com"]
  s.homepage = "https://github.com/activewarehouse/adapter_extensions"
  s.summary = %q{Extensions to Rails ActiveRecord adapters.}
  s.description = %q{Provides various extensions to the Rails ActiveRecord adapters.}
  s.required_rubygems_version = ">= 1.3.6"
  s.required_ruby_version = ">= 3.0"

  s.add_runtime_dependency('rake',                '>= 13.0')
  s.add_runtime_dependency('activesupport',       '>= 7.0', '< 8.0')
  s.add_runtime_dependency('activerecord',        '>= 7.0', '< 8.0')
  s.add_development_dependency('flexmock')
  s.add_development_dependency('cartesian')

  s.files              = `git ls-files`.split("\n")
  s.test_files         = `git ls-files -- {test}/*`.split("\n")
  s.require_path       = "lib"
end
