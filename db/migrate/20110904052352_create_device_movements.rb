class CreateDeviceMovements < ActiveRecord::Migration
  def self.up
    create_table :device_movements do |t|
      t.string :movement_type, :default => "arrival"
      t.string :node, :default => "unknown"
      t.string :device_bluetooth_id

      t.timestamps
    end
  end

  def self.down
    drop_table :device_movements
  end
end
