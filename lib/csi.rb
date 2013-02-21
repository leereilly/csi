class CSI
  def self.lookup_sic(code)
    return if code.nil?

    begin
      file = File.open("#{File.expand_path(__FILE__+'/..')}/data/sic/2000/#{code}", "rb")
      contents = file.read
      contents.strip!
      return contents
    rescue
      return nil
    end
  end

  def self.lookup_naics(code)
    return nil if code.nil?

    begin
      file = File.open("#{File.expand_path(__FILE__+'/..')}/data/naics/2012/#{code}", "rb")
      contents = file.read
      contents.strip!
      return contents
    rescue
      return nil
    end
  end
end