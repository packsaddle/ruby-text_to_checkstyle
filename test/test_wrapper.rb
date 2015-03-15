require_relative 'helper'

module TextToCheckstyle
  class TestCheckstyle < Test::Unit::TestCase
    test 'version' do
      assert do
        !::TextToCheckstyle::VERSION.nil?
      end
    end
  end
end
