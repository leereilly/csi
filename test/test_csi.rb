require 'helper'

class TestCsi < Test::Unit::TestCase
  should "find valid NAICS records" do
    naics_record = CSI::naics("928110")
    assert_equal "National Security", naics_record.name
    assert_equal ["9711"], naics_record.correlations
    puts naics_record.inspect
  end

  should "find valid SIC records" do
    sic_record = CSI::sic("8211")
    assert_equal "Elementary and Secondary Schools", sic_record.name
    assert_equal ["611110"], sic_record.correlations
    puts sic_record.inspect
  end

  should "find a record with multiple correlating records" do
    naics_record = CSI::naics("111339")
    assert_equal "Other Noncitrus Fruit Farming", naics_record.name
    assert_equal ["0175", "0179"], naics_record.correlations

    sic_record_1 = CSI::sic naics_record.correlations.first
    sic_record_2 = CSI::sic naics_record.correlations.last
    assert_equal "Deciduous Tree Fruits", sic_record_1.name
    assert_equal "Fruits and Tree Nuts, Not Elsewhere Classified", sic_record_2.name
    assert sic_record_1.correlations.include? naics_record.code
  end

end
