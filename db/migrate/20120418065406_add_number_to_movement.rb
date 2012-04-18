class AddNumberToMovement < ActiveRecord::Migration
  def self.up
    add_column :device_movements, :local_device_number, :string, :default => "unknown"
  end

  def self.down
    remove_column :device_movements, :local_device_number
  end
end
