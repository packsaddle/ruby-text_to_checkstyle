module TextToCheckstyle
  class Converter
    FILE_NAME = 'path/to/file'
    ERROR_LINE = '0'
    ERROR_COLUMN = '0'
    ERROR_SEVERITY = 'info'
    ERROR_SOURCE = 'TextToCheckstyle'
    def self.convert(text, options = {})
      fail NoInputError if !text || text.empty?
      logger.info(text: text)

      doc = REXML::Document.new
      doc.add REXML::XMLDecl.new
      checkstyle = doc.add_element 'checkstyle'
      name = options[:name] || FILE_NAME
      file = checkstyle.add_element 'file', 'name' => name
      line = options[:line] || ERROR_LINE
      column = options[:column] || ERROR_COLUMN
      severity = options[:severity] || ERROR_SEVERITY
      message = text
      source = options[:source] || ERROR_SOURCE
      file.add_element 'error',
                       'line' => line,
                       'column' => column,
                       'severity' => severity,
                       'message' => message,
                       'source' => source
      doc.to_s
    end
    def self.logger
      ::TextToCheckstyle.logger
    end
  end
end
