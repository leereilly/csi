require 'toml'
require 'csi/record'
require 'csi/errors'

module CSI
  class << self
    # Fetch a NAICS Record based on the 2-6 digit code.
    #
    # Returns a CSI::NAICSRecord if found; nil otherwise.
    def naics(code)
      naics_record = CSI::Record.new('NAICS', code)
    end

    # Fetch a SIC Record based on the 2-4 digit code.
    #
    # Returns a CSI::SICRecord if found; nil otherwise.
    def sic(code)
      sic_record = CSI::Record.new('SIC', code)
    end
  end
end