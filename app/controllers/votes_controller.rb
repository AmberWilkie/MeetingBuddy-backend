class VotesController < ApplicationController
  before_action :get_meeting_and_points

  def create
    vote = Vote.new(votable: @agenda_point, user: User.first, vote: params[:vote])
    if vote.save
      render json: { status: 'success',
                     yes_votes: @agenda_point.votes.where(vote: true).count,
                     no_votes: @agenda_point.votes.where(vote: false).count
      }
    else
      render json: { status: 'errror',
                     message: vote.errors.full_messages
      }
    end
  end

  def update
    vote = Vote.find(params[:id])
    vote.vote = params[:vote]
    if vote.save
      render json: { status: 'success',
                     yes_votes: @agenda_point.votes.where(vote: true).count,
                     no_votes: @agenda_point.votes.where(vote: false).count
      }
    else
      render json: { status: 'errror',
                     message: vote.errors.full_messages
      }
    end
  end

  private

  def get_meeting_and_points
    @meeting = Meeting.find(params[:meeting_id])
    @agenda_point = AgendaPoint.find(params[:agenda_point_id])
  end
end
