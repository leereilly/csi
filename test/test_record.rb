require 'helper'

class TestCsiRecord < Minitest::Test
  should "should return a valid record based on a valid type and code combo" do
    record = CSI::Record.new("NAICS", "336992")
    assert_equal "Military Armored Vehicle, Tank, and Tank Component Manufacturing", record.name
  end

  should "not care about case in the type parameter" do
    record = CSI::Record.new("naICs", "336992")
    assert_equal "Military Armored Vehicle, Tank, and Tank Component Manufacturing", record.name
  end

  should "demand an integer value for the code parameter" do
    assert_raises CSI::CodeInvalid  do
      CSI::Record.new("NAICS", 336992)
    end
  end

  should "raise CSI::ClassificationInvalid for valid type/invalid code combos" do
    assert_raises CSI::ClassificationInvalid do
      CSI::Record.new("NAICS", "999999999")
    end
  end

  should "raise CSI::TypeInvalid for valid type/invalid code combos" do
    assert_raises CSI::TypeInvalid do
      CSI::Record.new("LOL", "1337")
    end
  end

end
