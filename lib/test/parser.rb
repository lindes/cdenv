$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/..')

require 'cdenv/parser'
require 'test/unit'

class TestCDENVParser < Test::Unit::TestCase
  def test_parse
    assert_equal(['prepend_path', '/bin:/bin/first'], CDENV::Parser.parse("prepend_path: /bin:/bin/first"))
  end
end
