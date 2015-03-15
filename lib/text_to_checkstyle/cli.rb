require 'thor'

module TextToCheckstyle
  class CLI < Thor
    def self.exit_on_failure?
      true
    end

    desc 'version', 'Show the TextToCheckstyle version'
    map %w(-v --version) => :version

    def version
      puts "TextToCheckstyle version #{::TextToCheckstyle::VERSION}"
    end
  end
end
