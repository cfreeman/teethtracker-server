class DeviceMovement < ActiveRecord::Base
  validate :type_arrival_or_departure

  def self.current_devices(zone)
    DeviceMovement.where("node = ? and movement_type = 'arrival'", zone).order("created_at DESC").select("DISTINCT(device_bluetooth_id), created_at, local_device_number")
  end

  def self.device_status()
    device_numbers = DeviceMovement.select("local_device_number").group("local_device_number")

    devices = Array.new
    device_numbers.each do |device|
      d = DeviceMovement.where("local_device_number = ?", device.local_device_number).order("created_at DESC").first
      unless d.nil?
        devices.push(d)
      end
    end

    devices.sort do |a, b|
      a.local_device_number <=> b.local_device_number
    end
  end

  def self.node_names()
    movements = DeviceMovement.select("node").group("node")
    node_names = Array.new()
    movements.each do |movement|
      node_names.push(movement.node)
    end

    # Return the node names.
    node_names
  end

  private
  def type_arrival_or_departure
    errors.add(:movement_type, "Must be 'arrival' or 'departure'") unless self.movement_type == "arrival" or self.movement_type == "departure"
  end
end
