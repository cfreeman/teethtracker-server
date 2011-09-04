class Device < ActiveRecord::Base
  validates :bluetooth_id, :uniqueness => true
end
``