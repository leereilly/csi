class CSI

  CURRENT_SIC_YEAR   = 2000 # last accurate data set for SIC codes
  CURRENT_NAICS_YEAR = 2012 # last accurate data set for NAICS codes

  # Lookup the SIC code.
  #
  # Returns a String value of the SIC classification, or nil if not found.
  def self.lookup_sic(code)
    lookup_code("sic", CURRENT_SIC_YEAR, code)
  end

  # Lookup the NAICS code.
  #
  # Returns a String value of the NAICS classification, or nil if not found.
  def self.lookup_naics(code)
    lookup_code("naics", CURRENT_NAICS_YEAR, code)
  end

  private

  # Lookup the classification based on the type, year, and code.
  #
  # Returns a String value for the resquested classification, or nil if not
  # found.
  def self.lookup_code(type, year, code)
    begin
      file = File.open("#{File.expand_path(__FILE__+'/..')}/data/#{type}/#{year}/#{code}", "rb")
      contents = file.read
      contents.strip!
    rescue
      nil
    end
  end
end