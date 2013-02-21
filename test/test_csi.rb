require 'helper'

class TestCsi < Test::Unit::TestCase
  should "find a NAICS classification for 1123" do
    assert_equal CSI::lookup_naics(1123), 'Poultry and Egg Production'
  end

  should "not find a NAICS classification for 0000" do
    assert_equal CSI::lookup_naics(0000), nil
  end

  should "raise an error finding a NAICS classification for nil" do
    assert_raise TypeError do
      CSI::lookup_naics(nil)
    end
  end

  should "raise an error finding a NAICS classification for strings" do
    assert_raise TypeError do
      CSI::lookup_naics("1123")
    end
  end

  should "find a SIC classification for 8041" do
    assert_equal CSI::lookup_sic(8041), 'Offices And Clinics Of Chiropractors.'
  end

  should "not find a SIC classification for 0000" do
    assert_equal CSI::lookup_sic(0000), nil
  end

  should "raise an error finding a SIC classification for nil" do
    assert_raise TypeError do
      CSI::lookup_sic(nil)
    end
  end

  should "raise an error finding a SIC classification for strings" do
    assert_raise TypeError do
      CSI::lookup_sic("8041")
    end
  end
end
