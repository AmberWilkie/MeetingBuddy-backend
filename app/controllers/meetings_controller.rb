class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
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
    # obviously, we don't make Hack the only one who can make meetings... you know, later
    @meeting = Meeting.find(params[:id])
    if @meeting.update(sanitized_params)
      render :show
    else
      render json: { status: 'error',
                     message: @meeting.errors.full_messages
      }
    end
  end

  private

  def sanitized_params
    params.permit(:title,
                                    :summary,
                                    :location,
                                    :time,
                                    :user,
                                    :length
    )
  end
end
