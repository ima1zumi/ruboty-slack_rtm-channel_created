# frozen_string_literal: true

require_relative "lib/ruboty/slack_rtm/channel_created/version"

Gem::Specification.new do |spec|
  spec.name = "ruboty-slack_rtm-channel_created"
  spec.version = Ruboty::SlackRtm::ChannelCreated::VERSION
  spec.authors = ["ima1zumi"]
  spec.email = ["mariimaizumi5@gmail.com"]

  spec.summary = "Notify when channel_created with ruboty-slack_rtm."
  spec.homepage = "https://github.com/ima1zumi/ruboty-slack_rtm-channel_created"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "ruboty-slack_rtm"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
