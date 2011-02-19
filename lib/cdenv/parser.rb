module CDENV
  class Parser
    def self.parse(line)
      command, args = line.split(/:\s*/, 2)
      [command, args]
    end
  end
end
