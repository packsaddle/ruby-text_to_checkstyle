module TextToCheckstyle
  class Converter
    def self.convert(text)
      fail NoInputError if !text || text.empty?
      logger.info(text: text)

      doc = REXML::Document.new
      doc.add REXML::XMLDecl.new
      checkstyle = doc.add_element 'checkstyle'
      name = 'path/to/file'
      file = checkstyle.add_element 'file', 'name' => name
      line = '0'
      column = '0'
      severity = 'info'
      message = text
      source = 'TextToCheckstyle'
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
