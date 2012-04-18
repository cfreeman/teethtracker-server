require "spec_helper"

describe DeviceMovement do
  fixtures :device_movements

  it "should have a movement type of arrival or departure" do
    dm = DeviceMovement.new
    dm.movement_type = "arrival"
    dm.save.should eq true

    dm = DeviceMovement.new
    dm.movement_type = "departure"
    dm.save.should eq true

    dm = DeviceMovement.new
    dm.movement_type = "foo"
    dm.save.should eq false
  end

  it "should be able to list all the node names that have been used" do
    DeviceMovement.node_names.should eq ["station1", "station2"]
  end

  it "should be able to list the status of every device tracked" do
    status = DeviceMovement.device_status

    status.size.should eq 4
    status[0].node.should eq "station2"
    status[0].local_device_number.should eq "123"

    status[1].node.should eq "station1"
    status[1].local_device_number.should eq "456"

    status[2].node.should eq "station1"
    status[2].local_device_number.should eq "789"

    status[3].node.should eq "station1"
    status[3].local_device_number.should eq "unknown"
  end

  it "should be able to list all the devices that are at a particular node" do
    devices = DeviceMovement.current_devices("station2")

    devices.size.should eq 1
    devices[0].local_device_number.should eq "123"

    devices = DeviceMovement.current_devices("station1")
    # TODO: current_devices should not return a device if a device has arrived and departed from a station.
    devices.size.should eq 3
    devices[0].local_device_number.should eq "456"
  end
end