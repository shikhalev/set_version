# set_version

Make gem version with autoicrement build number

## Usage

```Ruby
Gem::Specification.new do |g|

  # some settings
  # g.files = [. . .]
  # important! files _must_ be set _before_ set_version call

  g.set_version 1, 0, 0, 'beta'

end
```

See usage example in [gemspec](set_version.gemspec).
