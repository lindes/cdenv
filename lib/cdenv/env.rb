# env module: Set a variable, and attempt to restore it.
# (n.b.: if multiple CDenv configs set the same variable, the restore may not go as expected.)

# example config line:
# env: TMPDIR=/path/to/some/other/tmp

# TODO: sanity checking on name

module CDENV
  class Env

    def self.env(arg)
      (name, rest) = arg.split(/=/, 2)
      rest += "" # unused
      old = ENV["#{name}"]
      # STDERR.puts "in CDENV::Env.rewind_env; name=#{name}; rest=#{rest}; old=#{old}"
      return "_cdenv_env_old_#{name}='#{old}' export _cdenv_env_old_#{name}\n#{arg} export #{name}"
    end

    def self.rewind_env(arg)
      (name, rest) = arg.split(/=/, 2)
      rest += "" # unused
      old = ENV["_cdenv_env_old_#{name}"]
      # STDERR.puts "in CDENV::Env.rewind_env; name=#{name}; rest=#{rest}; old=#{old}"
      if old.nil? or old.empty?
	return "unset #{name}"
      else
	return "#{name}='#{old}' export #{name}"
      end
    end

  end
end
