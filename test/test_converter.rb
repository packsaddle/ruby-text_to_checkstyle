require_relative 'helper'

module TextToCheckstyle
  class TestConverter < Test::Unit::TestCase
    test '.convert' do
      text = ''
      assert_raise(NoInputError) do
        Converter.convert(text)
      end
    end
  end
end
