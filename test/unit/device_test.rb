require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "numbers" do
    device = Device.new
    device.device_number = "61466494480"
    device.device_number.should eq "+61466494480"
  end
end
