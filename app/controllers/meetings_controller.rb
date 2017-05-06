class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
    render json: { meeting: @meeting,
                   user: @meeting.user
    }
  end
end
