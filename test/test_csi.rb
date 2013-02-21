require 'helper'

class TestCsi < Test::Unit::TestCase
  should "find a NAICS classification for 1123" do
    assert_equal CSI::lookup_naics(1123), 'Poultry and Egg Production'
  end

  should "not find a NAICS classification for 0000" do
    assert_equal CSI::lookup_naics(0000), nil
  end

  should "not find a NAICS classification for nil" do
    assert_equal CSI::lookup_naics(nil), nil
  end

  should "find a SIC classification for 8041" do
    assert_equal CSI::lookup_sic(8041), 'Offices And Clinics Of Chiropractors.'
  end

  should "not find a SIC classification for 0000" do
    assert_equal CSI::lookup_sic(0000), nil
  end

  should "not find a SIC classification for nil" do
    assert_equal CSI::lookup_sic(nil), nil
  end
end
