# set_version

Make gem version with autoicrement build number.

[![Gem Version](https://badge.fury.io/rb/set_version.svg)](http://badge.fury.io/rb/set_version)
[![GitHub license](https://img.shields.io/badge/license-LGPLv3-orange.svg?style=flat)](https://raw.githubusercontent.com/shikhalev/set_version/master/LICENSE)
[![Code Climate](https://codeclimate.com/github/shikhalev/set_version/badges/gpa.svg)](https://codeclimate.com/github/shikhalev/set_version)

```Ruby
set_version *vers, git: false, message: 'Build #%<version>s', tag: false
```

* `vers` — version numbers: major, minor, patch; and beta-flag — String
  or Symbol like 'alpha', 'beta', 'pre', 'rc' etc.
* `git:` — named parameter — boolean. If set to `true`, method will check
  where gemspec is under git control, add `gemvers`-file to git, and commit
  with `message`.
* `message:` — template for git commit message, can use named placeholders:
  * `:version` — result full version;
  * `:major`, `:minor`, `:patch` and `:beta` — parameters of calling;
  * `:build` — build number.
* `tag:` — if `true` and git enabled it is adding tag named by version.

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

## License

* [GNU Lesser General Public License v3](LICENSE)
