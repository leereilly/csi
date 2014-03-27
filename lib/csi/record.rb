module CSI
  class Record
    attr_accessor :type
    attr_accessor :code
    attr_accessor :name
    attr_accessor :correlations

    # Instantiate a CSI record based on a type ('NAICS' or 'SIC') and a code
    # assuming the code/type combination exists.
    #
    # Returns a CSI::Record object or nil if one couldn't be created.
    def initialize(type, code)
      raise CSI::CodeInvalid, 'String required' unless code.is_a? String

      type.downcase!
      raise CSI::TypeInvalid, 'Invalid type - SIC and NAICS only' unless type == 'naics' || type == 'sic'

      data_file = File.expand_path(__FILE__+"/../../data/#{type}/#{code}.toml")
      raise CSI::ClassificationInvalid unless File.exists? data_file

      begin
        @type = type
        @code = code
        toml_record = TOML.load_file(data_file)
        @name = toml_record["name"]

        if type == 'naics'
          @correlations = toml_record["sic_correlations"]
        elsif type == 'sic'
          @correlations = toml_record["naics_correlations"]
        end

        if @correlations.class == String
          @correlations = [@correlations]
        end

      rescue => e
        return nil
      end
    end
  end
end
