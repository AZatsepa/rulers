lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rulers/version'

Gem::Specification.new do |spec|
  spec.name          = 'rulers'
  spec.version       = Rulers::VERSION
  spec.authors       = ['zatsepa']
  spec.email         = ['artem.zatsepa@nixsolutions.com']

  spec.summary       = 'Rails-like application'
  spec.description   = 'Trying to build Rails-like framework'
  spec.homepage      = 'https://github.com/AZatsepa/rulers'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://github.com/AZatsepa/rulers'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/AZatsepa/rulers'
  spec.metadata['changelog_uri'] = 'https://github.com/AZatsepa/rulers/blob/master/README.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.required_ruby_version = '>=2.3'
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.39.0'

  spec.add_runtime_dependency 'rack', '~> 2.0.7'
end
