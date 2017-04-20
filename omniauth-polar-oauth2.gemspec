# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-polar-oauth2/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-polar-oauth2"
  spec.version       = OmniAuth::PolarOauth2::VERSION
  spec.authors       = ["Takuzi Santo"]
  spec.email         = ["takuzi.santo@ctc-g.co.jp"]

  spec.description   = %q{OmniAuth strategy for polar.com}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/z1g8078/omniauth-polar-oauth2"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency 'omniauth-oauth', '~> 1.3'
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
