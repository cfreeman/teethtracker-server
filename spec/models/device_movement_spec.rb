require "spec_helper"

describe DeviceMovement do

  it "should have a movement type of arrival or departure" do
    dm = DeviceMovement.new
    dm.movement_type = :arrival
    dm.save.should eq true

    dm = DeviceMovement.new
    dm.movement_type = :departure
    dm.save.should eq true

    dm = DeviceMovement.new
    dm.movement_type = "foo"
    dm.save.should eq false
  end

  it "should be able to list all the node names that have been used" do
    dm = DeviceMovement.new
    dm.movement_type = :arrival
    dm.node = "test1"
    dm.save

    dm = DeviceMovement.new
    dm.movement_type = :arrival
    dm.node = "test1"
    dm.save

    dm = DeviceMovement.new
    dm.movement_type = :arrival
    dm.node = "test2"
    dm.save

    DeviceMovement.node_names.should eq ["test1", "test2"]
  end

  it "should be able to list all the devices that are at a particular node" do

  end
end