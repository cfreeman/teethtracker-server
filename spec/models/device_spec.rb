require "spec_helper"

describe Device do
  before(:each) do
    @valid_attributes = {
      :bluetooth_id => "foo",
      :local_device_number => "0403315718",
    }
  end

  it "can be instantiated" do
    Device.new.should be_an_instance_of(Device)
  end

  it "automatically internationalizes local phone numbers" do
    device = Device.create!(@valid_attributes)
    device.international_device_number.should eq "+61403315718"
  end

  it "should have a unique bluetooth id" do
    device = Device.create!(@valid_attributes)

    device2 = Device.new(@valid_attributes)
    device2.should_not be_valid
  end
end