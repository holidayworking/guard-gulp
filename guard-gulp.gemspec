# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard/gulp/version"

Gem::Specification.new do |s|
  s.name        = "guard-gulp"
  s.version     = Guard::GulpVersion::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Nathan Fixler']
  s.email       = ['nathan@fixler.org']
  s.homepage    = 'http://rubygems.org/gems/guard-gulp'
  s.summary     = %q{guard gem for gulp}
  s.description = %q{Guard::Gulp automatically starts/stops/restarts gulp}

  s.required_rubygems_version = '>= 1.3.6'

  s.add_dependency 'guard', '>= 1.1'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]
end
