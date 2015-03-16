require_relative 'helper'

module TextToCheckstyle
  class TestConverter < Test::Unit::TestCase
    sub_test_case '.convert' do
      test 'empty text' do
        text = ''
        assert_raise(NoInputError) do
          Converter.convert(text)
        end
      end
      test 'valid text' do
        text = 'valid text'
        expected = <<-EOS.gsub(/[\n\r]/) { '' }.gsub(/[ ]{2,}/) { '' }
          <?xml version='1.0'?>
          <checkstyle>
            <file name='path/to/file'>
              <error column='0' line='0' message='valid text' severity='info' source='TextToCheckstyle'/>
            </file>
          </checkstyle>
        EOS
        assert do
          Converter.convert(text) == expected
        end
      end
    end
  end
end
