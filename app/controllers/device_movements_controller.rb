class DeviceMovementsController < ApplicationController
  def index
    @movements = DeviceMovement.order("id DESC").all

    respond_to do |format|
      format.html
      format.json { render :json => @movements }
      format.xml { render :xml => @movements }
    end
  end

  def currently_at
    results = Hash.new()
    node_names = DeviceMovement.node_names()
    node_names.each do |node_name|
      if results[node_name].nil?
        results[node_name] = Array.new()
      end

      DeviceMovement.current_devices(node_name).each do |device_movement|
        device = Device.find_by_bluetooth_id(device_movement.device_bluetooth_id)
        results[node_name].push(device)
      end
    end

    respond_to do |format|
      format.json {render :json => results}
      format.xml {render :xml => results}
    end
  end

  def show
    redirect_to(:controller => "device_movements", :action => "index")
  end

  def station1
    @response = Twilio::TwiML::Response.new do |r|
      r.Play 'http://teethtracker.heroku.com/call01.mp3'
      r.Dial :callerId => '+19138151163' do |d|
        d.Client 'Jenny'
      end
    end

    respond_to do |format|
      format.all {render :xml => @response.text }
    end
  end

  def station2
    @response = Twilio::TwiML::Response.new do |r|
      r.Play 'http://teethtracker.heroku.com/call02.mp3'
      r.Dial :callerId => '+19138151163' do |d|
        d.Client 'Jenny'
      end
    end

    respond_to do |format|
      format.all {render :xml => @response.text }
    end
  end

  def station3
    @response = Twilio::TwiML::Response.new do |r|
      r.Play 'http://teethtracker.heroku.com/call03.mp3'
      r.Dial :callerId => '+19138151163' do |d|
        d.Client 'Jenny'
      end
    end

    respond_to do |format|
      format.all {render :xml => @response.text }
    end
  end

  def station4
    @response = Twilio::TwiML::Response.new do |r|
      r.Play 'http://teethtracker.heroku.com/call04.mp3'
      r.Dial :callerId => '+19138151163' do |d|
        d.Client 'Jenny'
      end
    end

    respond_to do |format|
      format.all {render :xml => @response.text }
    end
  end

  def station5
    @response = Twilio::TwiML::Response.new do |r|
      r.Play 'http://teethtracker.heroku.com/call05.mp3'
      r.Dial :callerId => '+19138151163' do |d|
        d.Client 'Jenny'
      end
    end

    respond_to do |format|
      format.all {render :xml => @response.text }
    end
  end

  def station6
    @response = Twilio::TwiML::Response.new do |r|
      r.Play 'http://teethtracker.heroku.com/call06.mp3'
      r.Dial :callerId => '+19138151163' do |d|
        d.Client 'Jenny'
      end
    end

    respond_to do |format|
      format.all {render :xml => @response.text }
    end
  end

  def new
    @movement = DeviceMovement.new
    @movement.movement_type = params[:type]
    @movement.node = params[:node]
    @movement.device_bluetooth_id = params[:bluetooth_id]
    @movement.save

    #Look up the device to use to make the call.
    device = Device.find_by_bluetooth_id(params[:bluetooth_id])

    # Put your twilio own credentials here
    account_sid = 'AC31e6c16f74a6493da8725101e602d072'
    auth_token = '4617d77a1eef5cf370bb984df416c679'


      # set up a client to talk to the Twilio REST API
      client = Twilio::REST::Client.new account_sid, auth_token

      client.account.calls.create(
        :from => '+19138151163',
        :to => '+61' + params[:number],
        :url => root_url + params[:node]
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
