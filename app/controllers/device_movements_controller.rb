class DeviceMovementsController < ApplicationController
  def index
    @movements = DeviceMovement.all

    respond_to do |format|
      format.html
      format.json { render :json => @movements }
    end
  end

  def show
    redirect_to(:controller => "device_movements", :action => "index")
  end

  def new
    @movement = DeviceMovement.new
    @movement.movement_type = params[:type]
    @movement.node = params[:node]
    @movement.device_bluetooth_id = params[:bluetooth_id]
    print "about to save"
    @movement.save

    redirect_to(:controller => "device_movements", :action => "index")
  end

  def create
    redirect_to(:controller => "device_movements", :action => "index")
  end

  def edit
    redirect_to(:controller => "device_movements", :action => "index")
  end

  def update
    redirect_to(:controller => "device_movements", :action => "index")
  end

  def destroy
    redirect_to(:controller => "device_movements", :action => "index")
  end
end
