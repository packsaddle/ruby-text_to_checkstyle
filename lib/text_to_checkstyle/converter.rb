module TextToCheckstyle
  class Converter
    def self.convert(text)
      fail NoInputError if !text || text.empty?
      logger.info(text: text)
      text.upcase
    end
    def self.logger
      ::TextToCheckstyle.logger
    end
  end
end
