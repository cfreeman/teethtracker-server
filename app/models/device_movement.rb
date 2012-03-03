class DeviceMovement < ActiveRecord::Base

  def self.current_devices(zone)
    DeviceMovement.where("node = ? and movement_type = ?", zone, "arrival").order("created_at DESC").select("DISTINCT(device_bluetooth_id), created_at")
  end

  #validates_inclusion_of :movement_type, :in => [:arrival, :departure]
end
