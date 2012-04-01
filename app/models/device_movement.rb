class DeviceMovement < ActiveRecord::Base
  #validates_inclusion_of :movement_type, :in => [:arrival, :departure]

  def self.current_devices(zone)
    DeviceMovement.where("node = ? and movement_type = ?", zone, "arrival").order("created_at DESC").select("DISTINCT(device_bluetooth_id), created_at")
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
end
