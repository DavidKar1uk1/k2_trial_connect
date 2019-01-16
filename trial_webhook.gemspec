
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "trial_webhook/version"

Gem::Specification.new do |spec|
  spec.name          = "trial_webhook"
  spec.version       = TrialWebhook::VERSION
  spec.authors       = ["DavidKar1uk1"]
  spec.email         = ["David.mwangi@kopokop.com"]

  spec.summary       = %q{A Gem that consumes a webhook and displays the JSON content.}
  spec.description   = %q{It is supposed to listen to a port, after a merchant transacts a buy goods, reversals, completes a settlement and creates a customer, the transaction should be displayed and sent to them.}
  spec.homepage      = "https://github.com/DavidKar1uk1/k2_trial_connect.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/DavidKar1uk1/k2_trial_connect.git"
    spec.metadata["changelog_uri"] = "https://github.com/DavidKar1uk1/k2_trial_connect.git"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "activesupport", "~> 4.2.0"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "thor"

  # Normal Testing
  # spec.add_development_dependency "minitest"
  # spec.add_development_dependency "vcr"
  # spec.add_development_dependency "webmock"
  #
  # Hard dependencies
  spec.add_development_dependency "faraday"


end
