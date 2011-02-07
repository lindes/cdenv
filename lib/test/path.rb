$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/..')

require 'cdenv/path'
require 'test/unit'

class TestCDENVPath < Test::Unit::TestCase
  def test_prepend_path
    assert_equal("PATH=/bin:/usr/local/bin", CDENV::Path.prepend_path('/bin', '/usr/local/bin'))
    ENV['PATH'] = '/opt/local/bin'
    assert_equal("PATH=/bin:/opt/local/bin", CDENV::Path.prepend_path('/bin'))
  end
end
