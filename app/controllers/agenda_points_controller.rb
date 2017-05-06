class AgendaPointsController < ApplicationController
  before_action :get_meeting, only: [:index]

  def index
    @agenda_points = @meeting.agenda_points
    render json: {agenda_points: @agenda_points}
  end

  private

  def get_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end
end
