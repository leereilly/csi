module CSI

  class Error < StandardError
  end

  # Raised when trying to find an invalid code - a code
  # that does not exist, or is not a String value e.g.
  #
  #   CSI::naics("1337")
  #   # => CSI::CodeInvalid
  #
  #   CSI::sic(1337)
  #   # => CSI::CodeInvalid
  #
  class CodeInvalid < Error
  end

  # Raised when trying to find an invalid type e.g.
  #
  #   CSI::naics("FBI")
  #   # => CSI::TypeInvalid
  #
  #   CSI::sic("CIA")
  #   # => CSI::TypeInvalid
  #
  class TypeInvalid < Error
  end

  # Raised when trying to find an invalid code/type combination
  #
  #   CSI::Record.new('NAICS', "1337")
  #   # => CSI::ClassificationInvalid
  #
  #   CSI::Record.new('SIC', "1337")
  #   # => CSI::ClassificationInvalid
  #
  class ClassificationInvalid < Error
  end

end