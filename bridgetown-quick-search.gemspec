# frozen_string_literal: true

require_relative "lib/bridgetown-quick-search/version"

Gem::Specification.new do |spec|
  spec.name          = "bridgetown-quick-search"
  spec.version       = Bridgetown::QuickSearch::VERSION
  spec.author        = "Bridgetown Team"
  spec.email         = "maintainers@bridgetownrb.com"
  spec.summary       = "A component for Bridgetown sites which performs search queries with Lunr.js."
  spec.homepage      = "https://github.com/bridgetownrb/bridgetown-quick-search"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|script|spec|features|frontend)/!) }
  spec.test_files    = spec.files.grep(%r!^spec/!)
  spec.require_paths = ["lib"]
  spec.metadata      = { "yarn-add" => "bridgetown-quick-search@#{Bridgetown::QuickSearch::VERSION}" }

  spec.required_ruby_version = ">= 3.1.0"

  spec.add_dependency "bridgetown", ">= 1.2.0.beta2", "< 3.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "nokogiri", "~> 1.6"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop-bridgetown", "~> 0.3"
end
