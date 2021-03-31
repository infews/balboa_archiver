# frozen_string_literal: true

require_relative "lib/balboa_archiver/version"

Gem::Specification.new do |spec|
  spec.name = "balboa_archiver"
  spec.version = BalboaArchiver::VERSION
  spec.authors = ["Davis W. Frank"]
  spec.email = ["dwfrank@gmail.com"]

  spec.summary = "A Ruby Gem for archiving files according to the Balboa Archving method"
  spec.description = "Some utils I use all the time, that happen to be TDD'd in Ruby"
  spec.homepage = "https://github.com/infews/balboa_archiver"
  spec.license = "MIT"

  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = "bin"
  spec.executables = "archive"
  spec.require_paths = ["lib"]

  spec.add_dependency "rainbow"
  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", ">= 2.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "standard"
  spec.add_development_dependency "timecop"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
