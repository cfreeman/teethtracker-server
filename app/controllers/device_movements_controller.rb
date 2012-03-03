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

    # put your own credentials here
    account_sid = 'AC31e6c16f74a6493da8725101e602d072'
    auth_token = '4617d77a1eef5cf370bb984df416c679'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.calls.create(
      :from => '+19138151163',
      :to => '+61439727186',
      :url => root_url + 'station1.html'
    )

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
