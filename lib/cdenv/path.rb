module CDENV
  class Path

    def self.prepend_path(dir, start = ENV['PATH'])
      return "PATH=#{dir}:#{start}"
    end

    def self.rewind_prepend_path(dir, start = ENV['PATH'])
      return "PATH=#{start.sub(dir+':', '')}"
    end

  end
end
