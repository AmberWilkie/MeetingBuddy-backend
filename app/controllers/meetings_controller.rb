class MeetingsController < ApplicationController
  before_action :find_meeting, only: [:show, :update, :destroy]

  def index
    # should condition this to only meetings I'm invited to.
    # invites = Invite.all
    # @meetings = []
    # invites.each do |invite|
    #   @meetings << invite.meeting
    # end
    # @meetings.uniq!
    @meetings = Meeting.all
  end

  def show
    time = 0
    @meeting.agenda_points.each do |point|
      time += point.time
    end
    @meeting.length = time
    get_participants
    if @meeting.save
      render :show
    else
      render json: { status: 'error',
                     message: @meeting.errors.full_messages
      }
    end
  end

  def create
    # obviously, we don't make Hack the only one who can make meetings... you know, later
    @meeting = Meeting.new( user: User.first,
                            location: params[:location],
                            time: params[:time],
                            title: params[:title],
                            summary: params[:summary],
                            length: params[:length]
    )
    if @meeting.save
      render :show
    else
      render json: { status: 'error',
                     message: @meeting.errors.full_messages
      }
    end
  end

  def update
    if @meeting.update(sanitized_params)
      render :show
    else
      render json: { status: 'error',
                     message: @meeting.errors.full_messages
      }
    end
  end

  def destroy
    if @meeting.delete
      render json: { status: 'success'}
    else
      render json: { status: 'error', message: @meeting.errors.full_messages }
    end
  end

  private

  def find_meeting
    @meeting = Meeting.find(params[:id])
  end

  def sanitized_params
    params.permit(:title,
                                    :summary,
                                    :location,
                                    :time,
                                    :user,
                                    :length
    )
  end

  def get_participants
    @participants = []
    @meeting.invites.each do |invite|
      @participants << invite.user
    end
  end
end
