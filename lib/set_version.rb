# encoding: utf-8

require 'rubygems'
require 'digest/sha1'

class Gem::Specification

  SET_VERSION_VERSION = [0, 1]

  def set_version *vers, git: true, message: 'Build #%<version>'

    if Integer === vers[-1]
      beta = ''
    else
      beta = vers.pop.to_s
    end
    major = vers[0] || 0
    minor = vers[1] || 0
    patch = vers[2] || 0
    key = "#{major}.#{minor}.#{patch}.#{beta}"

    s_fn = caller_locations[0].absolute_path
    s_nm = File.basename caller_locations[0].path, '.gemspec'
    v_fn = File.expand_path "../#{s_nm}.gemvers", s_fn
    if File.exist? v_fn
      data = eval(File.read v_fn)
    else
      data = {}
    end
    stored = data[key]
    if !stored
      stored = {}
    end
    build = stored[:build] || -1

    digest = Digest::SHA1.new
    digest << (File.read s_fn)
    files.each do |f|
      digest << (File.read f)
    end

    if digest.hexdigest != stored[:hash]
      build += 1
      stored[:hash] = digest.hexdigest
      stored[:build] = build
      data[key] = stored
      File.open(v_fn, 'w') { |f| f.puts data.inspect }
    end

    if beta == '' && build == 0
      if patch == 0
        result = "#{major}.#{minor}"
      else
        result = "#{major}.#{minor}.#{patch}"
      end
    else
      result = "#{major}.#{minor}.#{patch}.#{beta}#{build}"
    end
    self.version = result

    if git
      msg = message % { version: result, major: major, minor: minor,
                        patch: patch, beta: beta, build: build }
      if system "git ls-files #{s_fn} --error-unmatch > /dev/null 2>&1"
        system "git add #{v_fn} > /dev/null 2>&1"
        system "git commit -a -m '#{msg}' > /dev/null 2>&1"
      end
    end

    return result

  end

end
