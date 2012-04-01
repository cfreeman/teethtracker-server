require "spec_helper"

describe Device do
    it "can be instantiated" do
      Device.new.should be_an_instance_of(Device)
    end

    it "automatically internationalizes local phone numbers" do
      device = Device.new
      device.local_device_number = "0403315718"
      device.save
      device.international_device_number.should eq "+61403315718"
    end

    it "should have a unique bluetooth id" do
      device = Device.new
      device.bluetooth_id = "foo"
      device.save
      device2 = Device.new
      device2.bluetooth_id = "foo"
      device2.save.should eq false
    end
end