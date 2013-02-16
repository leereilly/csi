require 'helper'

class TestCsi < Test::Unit::TestCase
  should "find a sic classification" do
    assert_equal CSI::lookup_sic(1), 1
  end

  should "find a naics classification" do
    assert_equal CSI::lookup_naics(2), 2
  end
end
