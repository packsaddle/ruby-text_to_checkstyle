require 'logger'
require 'rexml/document'

require 'text_to_checkstyle/converter'
require 'text_to_checkstyle/error'
require 'text_to_checkstyle/version'

module TextToCheckstyle
  ISSUE_URL = 'https://github.com/packsaddle/ruby-text_to_checkstyle/issues/new'

  def self.default_logger
    logger = Logger.new(STDERR)
    logger.progname = "TextToCheckstyle/#{VERSION}"
    logger.level = Logger::WARN
    logger
  end

  def self.logger
    return @logger if @logger
    @logger = default_logger
  end

  class << self
    attr_writer :logger
  end
end
