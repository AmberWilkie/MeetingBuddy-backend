class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
    render json: {meetings: @meetings}
  end
end
