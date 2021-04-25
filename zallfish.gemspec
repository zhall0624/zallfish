require_relative 'lib/zallfish/version'

Gem::Specification.new do |spec|
  spec.name          = "zallfish"
  spec.version       = Zallfish::VERSION
  spec.authors       = ["Zach Hall"]
  spec.email         = ["zach@tyemill.com"]

  spec.summary       = %q{ This is Zallfish, a chess engine that's probably bad. }
  spec.description   = %q{ Name is literally a rip off of Stockfish but ideas are mine }
  spec.homepage      = "https://github.com/lc41-devgrounds/zallfish"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/lc41-devgrounds/zallfish"
  spec.metadata["changelog_uri"] = "https://github.com/lc41-devgrounds/zallfish"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
