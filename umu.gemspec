# frozen_string_literal: true

require_relative "lib/umu/version"

Gem::Specification.new do |spec|
  spec.name = "umu"
  spec.version = Umu::VERSION
  spec.authors = ["Kuan-Hung Chen"]
  spec.email = ["kankou.chin@gmail.com"]

  spec.summary = "A framework for make Ruby on Rails's command."
  spec.description = <<-DESCRIPTION
    Umu is a framework that supports you to make command in Ruby on Rails.
  DESCRIPTION
  spec.homepage = "https://github.com/chen-196-hub/umu"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/chen-196-hub/umu"
  spec.metadata["changelog_uri"] = "https://github.com/chen-196-hub/umu/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "activesupport", ">= 3.0.0"
  spec.add_dependency "i18n", ">= 1.8"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
