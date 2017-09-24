lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'taigar/version'

Gem::Specification.new do |spec|
  spec.name          = 'taigar'
  spec.version       = Taigar::VERSION
  spec.authors       = ['hirakiuc']
  spec.email         = ['hirakiuc@gmail.com']

  spec.summary       = 'taiga.io REST API client library.'
  spec.description   = 'taigar is a REST API client library of taiga.io.'
  spec.homepage      = 'https://github.com/hirakiuc/taigar'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless
    spec.respond_to?(:metadata)
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.files         = Dir[
    'lib/**/*', 'LICENSE', 'Rakefile', 'Gemfile', 'taigar.gemspec', 'README.md', '.rubocop.yml']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday', '~> 0.13.0'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.10.0'
  spec.add_runtime_dependency 'activesupport', '~> 5.1.4'
  spec.add_runtime_dependency 'hashie', '~> 3.5.6'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
