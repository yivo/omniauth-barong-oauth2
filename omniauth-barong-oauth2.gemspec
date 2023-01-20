# encoding: UTF-8
# frozen_string_literal: true

require File.expand_path("../lib/omniauth-barong-oauth2/version", __FILE__)

Gem::Specification.new do |s|
  s.name          = "omniauth-barong-oauth2"
  s.version       = OmniAuthBarongOAuth2::VERSION
  s.author        = "Yaroslav Konoplov"
  s.email         = "eahome00@gmail.com"
  s.summary       = "OmniAuth strategy for Barong OAuth2."
  s.description   = "The OmniAuth strategy for authenticating users using Barong (open-source OAuth2 and KyC server powered by Doorkeeper)."
  s.homepage      = "https://github.com/yivo/omniauth-barong-oauth2"
  s.license       = "Apache-2.0"
  s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = `git ls-files -z -- {test,spec,features}/*`.split("\x0")
  s.require_paths = ["lib"]

  s.add_dependency             "omniauth-oauth2", "~> 1.5"
  s.add_dependency             "activesupport", ">= 4.0", "< 8.0"
  s.add_development_dependency "bundler", "~> 1.7"
end
