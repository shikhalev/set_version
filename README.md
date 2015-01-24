# set_version

Make gem version with autoicrement build number

```Ruby
set_version *vers, git: false, message: 'Build #%<version>s'
```

* `vers` — version numbers: major, minor, patch; and beta-flag — String
  or Symbol like 'alpha', 'beta', 'pre', 'rc' etc.

## Usage

```Ruby
Gem::Specification.new do |g|

  # some settings
  # g.files = [. . .]
  # important! files _must_ be set _before_ set_version call

  g.set_version 1, 0, 0, 'beta'

end
```

See example in [gemspec](set_version.gemspec).
