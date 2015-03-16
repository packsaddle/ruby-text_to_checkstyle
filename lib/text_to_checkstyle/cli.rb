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

    desc 'convert', 'Convert text to checkstyle'
    option :debug, type: :boolean, default: false
    option :verbose, type: :boolean, default: false
    option :data
    option :file
    option :name, type: :string, default: Converter::FILE_NAME
    option :line, type: :string, default: Converter::ERROR_LINE
    option :column, type: :string, default: Converter::ERROR_COLUMN
    option :severity, type: :string, default: Converter::ERROR_SEVERITY
    option :source, type: :string, default: Converter::ERROR_SOURCE
    def convert
      setup_logger(options)
      data = \
          if options[:data]
            options[:data]
          elsif options[:file]
            File.read(options[:file])
          elsif !$stdin.tty?
            ARGV.clear
            ARGF.read
          end

      fail(NoInputError) if !data || data.empty?
      params = {
        name: options[:name],
        line: options[:line],
        column: options[:column],
        severity: options[:severity],
        source: options[:source]
      }
      puts ::TextToCheckstyle::Converter.convert(data, params)
    rescue StandardError => e
      suggest_messages(options)
      raise e
    end
    default_command :convert

    no_commands do
      def logger
        ::TextToCheckstyle.logger
      end

      def setup_logger(options)
        if options[:debug]
          logger.level = Logger::DEBUG
        elsif options[:verbose]
          logger.level = Logger::INFO
        end
        logger.debug(options)
      end

      def suggest_messages(options)
        logger.error 'Have a question? Please ask us:'
        logger.error ISSUE_URL
        logger.error 'options:'
        logger.error options
      end

      # http://stackoverflow.com/a/23955971/104080
      def method_missing(method, *args)
        self.class.start([self.class.default_command, method.to_s] + args)
      end
    end
  end
end
