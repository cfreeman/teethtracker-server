class Device < ActiveRecord::Base
  validates :bluetooth_id, :uniqueness => true
  before_save :update_international_number

  def update_international_number
    number = read_attribute(:local_device_number)
    write_attribute(:international_device_number, "+61" + number[1, number.length])
  end
end