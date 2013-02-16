require 'helper'

class TestCsi < Test::Unit::TestCase
  should "find a NAICS classification for 1123" do
    assert_equal CSI::lookup_naics(1123), 'Poultry and Egg Production'
  end

  should "non find a NAICS classification for 0000" do
    assert_equal CSI::lookup_naics(0000), nil
  end

  should "not find a NAICS classification for nil" do
    assert_equal CSI::lookup_naics(nil), nil
  end
end
