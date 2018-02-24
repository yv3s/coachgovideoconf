require "opentok"

class RoomsController < ApplicationController
  before_action :config_opentok, except: [:index]

  def index
    @rooms = Room.where(public: true)
    @new_room = Room.new
  end

def create
  @new_room = Room.new(room_params)
  session = @opentok.create_session
  @new_room.sessionId = session.session_id
  if @new_room.save
    redirect_to room_path(@new_room)
  else
    redirect_to rooms_path
    end
  end

  def show
    @room = Room.find(params[:id])
    @tok_token = @opentok.generate_token @room.sessionId
  end

  private
  def config_opentok
    if @opentok.nil?
      @opentok = OpenTok::OpenTok.new "46067192", "f784261d09ecdb32a542f7927326589b19101b6d"
    end
  end

  def room_params
    params.require(:room).permit(:public, :name)
  end

end
