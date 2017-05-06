  json.meeting @meeting
  json.user @meeting.user
  json.participants @participants
  json.invites @meeting.invites
  json.agenda_points @meeting.agenda_points.each do |ap|
    json.item do
      json.agenda_point ap
      if ap.votes.any?
        json.has_votes true
        json.yes_votes ap.votes.where(vote: true).count
        json.no_votes ap.votes.where(vote: false).count
      end
    end
  end