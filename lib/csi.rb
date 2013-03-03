require 'toml'
require 'record'
require 'errors'

module CSI
  class << self
    # Fetch a NAICS Record based on the 2-6 digit code.
    #
    # Returns a CSI::NAICSRecord if found; nil otherwise.
    def naics(code)
      return nil unless File.exists? File.expand_path(__FILE__+"/../data/naics/#{code}.toml")
      naics_record = CSI::Record.new('NAICS', code)
    end

    # Fetch a SIC Record based on the 2-4 digit code.
    #
    # Returns a CSI::SICRecord if found; nil otherwise.
    def sic(code)
      return nil unless File.exists? File.expand_path(__FILE__+"/../data/sic/#{code}.toml")
      sic_record = CSI::Record.new('SIC', code)
    end
  end
end