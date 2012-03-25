class DevicesController < ApplicationController
  def index
    @devices = Device.all

    respond_to do |format|
      format.html
      format.json { render :json => @devices }
      format.xml { render :xml => @devices }
    end
  end

  def show
    redirect_to(:controller => "devices", :action => "index")
  end

  def new
    @device = Device.find_by_bluetooth_id(params[:bluetooth_id])

    if @device.nil?
      @device = Device.new
      @device.bluetooth_id = params[:bluetooth_id]
    end

    @device.device_name = params[:name]
    @device.local_device_number = params[:number]
    @device.save

    redirect_to(:controller => "devices", :action => "index")
  end

  def clear_database
    DeviceMovement.delete_all
    Device.delete_all
  end

  def create
    redirect_to(:controller => "devices", :action => "index")
  end

  def edit
    redirect_to(:controller => "devices", :action => "index")
  end

  def update
    redirect_to(:controller => "devices", :action => "index")
  end

  def destroy
    # Delete the device and the movements stored in the database.
    devices = Device.find_all_by_bluetooth_id(params[:bluetooth_id])
    devices.each do |device|
      res = device.delete
    end

    device_movements = DeviceMovement.find_all_by_device_bluetooth_id(params[:bluetooth_id])
    device_movements.each do |device_movement|
      res = device_movement.delete
    end

    redirect_to(:controller => "devices", :action => "index")
  end
end
