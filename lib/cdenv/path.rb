module CDENV
  class Path
    
    def self.prepend_path(dir, start = ENV['PATH'])
      return "PATH=#{dir}:#{start}"
    end
  end
end
