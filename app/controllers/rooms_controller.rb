require "opentok"
require 'typeform'

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

  def autoeval

end

private
def config_opentok
  if @opentok.nil?
    @opentok = OpenTok::OpenTok.new ENV["open_tok_api"], ENV["open_tok_secret"]
  end
end

def room_params
  params.require(:room).permit(:public, :name)
end

end
