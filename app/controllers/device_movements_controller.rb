class DeviceMovementsController < ApplicationController
  def index
    @movements = DeviceMovement.order("id DESC").all

    respond_to do |format|
      format.html
      format.json { render :json => @movements }
      format.xml { render :xml => @movements }
    end
  end

  def currently_at_node
    @movements = DeviceMovement.current_devices(params[:node])

    respond_to do |format|
      format.json {render :json => @movements}
      format.xml {render :xml => @movements}
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
