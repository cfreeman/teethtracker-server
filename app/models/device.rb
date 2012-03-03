class Device < ActiveRecord::Base
  validates :bluetooth_id, :uniqueness => true

  def device_number= (number)
    write_attribute(:device_number, "+61" + number[1, number.length])
  end

  def device_number
    number =  read_attribute(:device_number)
    "0" + number[3, number.length]
  end

  def device_international_number
    read_attribute(:device_number)
  end
end