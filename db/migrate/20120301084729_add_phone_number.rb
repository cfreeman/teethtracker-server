class AddPhoneNumber < ActiveRecord::Migration
  def self.up
    add_column :devices, :local_device_number, :string, :default => "unknown"
    add_column :devices, :international_device_number, :string, :default => "unknown"
  end

  def self.down
    remove_column :devices, :international_device_number
    remove_column :devices, :local_device_number
  end
end
