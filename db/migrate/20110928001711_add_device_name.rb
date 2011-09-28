class AddDeviceName < ActiveRecord::Migration
  def self.up
    add_column :devices, :device_name, :string, :default => "unknown"
  end

  def self.down
    remove_column :devices, :device_name
  end
end
