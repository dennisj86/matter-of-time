class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  skip_after_action :verify_authorized
  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
    @user = current_user
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @user = current_user
    require 'rubygems'
    require 'twilio-ruby'
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    unless @room.room_sid.present?
      # create room in twilio
      twilio_room = @client.video.rooms.create(type: 'peer-to-peer',unique_name: @room.unique_name)
      @room.update(room_sid: twilio_room.sid)
    end
    identity = (0...5).map { ('a'..'z').to_a[rand(26)] }.join
    @room_name = @room.unique_name

    #create token to access Twilio room
    @token = Twilio::JWT::AccessToken.new(ENV['ACCOUNT_SID'], ENV['API_KEY_SID'],ENV['API_KEY_SECRET'], identity: identity)

    #create video grant for token
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    grant.room = @room_name

    @token.add_grant grant
    @token = @token.to_jwt
  end

  # GET /rooms/new
  def new
    @user = current_user
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name)
    end
end
