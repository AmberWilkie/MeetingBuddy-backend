class InvitesController < ApplicationController
  before_action :get_meeting, only: [:create, :update]
  before_action :get_user, only: [:create, :update]

  def create
    @invite = Invite.new(meeting: @meeting, user: @user)
    if @invite.save
      render json: { status: 'success'}
    else
      render json: { status: 'error', message: @invite.errors.full_messages }
    end
  end

  def update
    @invite = Invite.where(meeting: @meeting, user: @user).first
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

  def get_user
    @user = User.find(params[:user_id])
  end
end
