require 'helper'

class ErrorsTest < Minitest::Test

  def test_error_inheritance
    assert_kind_of  StandardError,
                    CSI::Error.new
  end

  def test_code_invalid_inheritance
    assert_kind_of  CSI::Error,
                    CSI::CodeInvalid.new
  end

  def test_type_invalid_inheritance
    assert_kind_of  CSI::Error,
                    CSI::TypeInvalid.new
  end

  def test_classification_invalid_inheritance
    assert_kind_of  CSI::Error,
                    CSI::ClassificationInvalid.new
  end

end
