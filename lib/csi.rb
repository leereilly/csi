require 'toml'

class CSI
  # Lookup the SIC code.
  #
  # Returns a String value of the SIC classification, or nil if not found.
  def self.lookup_sic(code)
    lookup_code("sic", code)
  end

  # Lookup the NAICS code.
  #
  # Returns a String value of the NAICS classification, or nil if not found.
  def self.lookup_naics(code)
    lookup_code("naics", code)
  end

  private

  # Lookup the classification based on the type, year, and code.
  #
  # Returns a String value for the resquested classification, or nil if not
  # found.
  def self.lookup_code(type, code)
    raise TypeError, 'Integer required' unless code.is_a? Integer

    begin
      TOML.load_file("#{File.expand_path(__FILE__+'/..')}/data/#{type}/#{code}.toml")["name"]
    rescue
      return nil
    end
  end
end