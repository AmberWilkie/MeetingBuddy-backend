class AgendaPointsController < ApplicationController
  before_action :get_meeting, only: [:index, :create]

  def index
    @agenda_points = @meeting.agenda_points
    render json: {agenda_points: @agenda_points}
  end

  def create
    @agenda_point = AgendaPoint.new(sanitized_params)
    @user = User.find(params[:user_id])
    @agenda_point.user = @user
    @agenda_point.meeting = @meeting
    if @agenda_point.save
      render json: { status: 'success' }
    else
      render json: { status: 'error',
                     message: @agenda_point.errors.full_messages
      }
    end
  end

  private

  def get_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def sanitized_params
    params.permit( :time,
                   :body
    )
  end
end
