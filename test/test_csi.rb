require 'helper'

class TestCsi < Test::Unit::TestCase
  should "find a sic classification" do
    assert_equal csi::lookup_sic 1, 1
  end
end
