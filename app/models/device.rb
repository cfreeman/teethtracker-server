class Device < ActiveRecord::Base
  validates :bluetooth_id, :uniqueness => true

  def device_number=(number)
    device_number = "+" + number
  end
end