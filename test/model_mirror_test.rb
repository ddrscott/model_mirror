require 'test_helper'

class ModelMirrorTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, ModelMirror
  end
end
