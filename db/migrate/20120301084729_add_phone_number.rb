class AddPhoneNumber < ActiveRecord::Migration
  def self.up
    add_column :devices, :device_number, :string, :default => "unknown"
  end

  def self.down
    remove_column :devices, :device_number
  end
end
