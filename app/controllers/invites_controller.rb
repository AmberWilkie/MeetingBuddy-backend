class InvitesController < ApplicationController
  before_action :get_meeting, only: [:create, :update]

  def create
    # again, poor Hack has to go to a lot of meetings
    @invite = Invite.where(meeting: @meeting, user: User.first).first
    @invite.accepted = params[:accepted]
    if @invite.save
      render json: { status: 'success'}
    else
      render json: { status: 'error', message: @invite.errors.full_messages }
    end
  end

  def update
    # again, poor Hack has to go to a lot of meetings
    @invite = Invite.where(meeting: @meeting, user: User.first).first
    @invite.accepted = params[:accepted]
    if @invite.save
      render json: { status: 'success'}
    else
      render json: { status: 'error', message: @invite.errors.full_messages }
    end
  end

  private

  def get_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end
end
