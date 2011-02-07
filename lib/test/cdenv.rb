$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/..')

require 'test/unit'
require 'cdenv'

class TestCDENVCore < Test::Unit::TestCase
  def test_find_method_bogus
    assert_nil(CDENV.find_method('no_such_method'), "find_method on bogus data")
  end

  def test_find_method_string
    assert_equal(CDENV::Path.method(:prepend_path),
                 CDENV.find_method('prepend_path'),
                 "finding prepend_path by name")
  end

  def test_find_method_symbol
    assert_equal(CDENV::Path.method(:prepend_path),
                 CDENV.find_method(:prepend_path),
                 "finding :prepend_path by symbol")
  end
end
