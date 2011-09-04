class DevicesController < ApplicationController
  def index
    @devices = Device.all

    respond_to do |format|
      format.html
      format.json { render :json => @devices }
    end
  end

  def show
    redirect_to(:controller => "devices", :action => "index")
  end

  def new
    @device = Device.new
    @device.bluetooth_id = params[:bluetooth_id]
    @device.save

    redirect_to(:controller => "devices", :action => "index")
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
    redirect_to(:controller => "devices", :action => "index")
  end
end
