# encoding: utf-8

require_relative 'lib/set_version';

Gem::Specification.new do |g|

  g.name = File.basename __FILE__, ".gemspec"
  g.summary = 'Make gem version with autoicrement build number'
  g.author = 'Ivan Shikhalev'
  g.email = 'shikhalev@gmail.com'
  g.homepage = 'https://github.com/shikhalev/set_version'
  g.description = g.summary + '.'
  g.license = 'GNU LGPLv3'

  g.files = [ 'lib/set_version.rb', 'README.md', 'LICENSE' ]

  g.set_version *SET_VERSION_VERSION, git: true

  g.require_path = 'lib'
  g.required_ruby_version = '~> 2.0'

end

