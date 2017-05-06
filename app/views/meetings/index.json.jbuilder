json.meetings @meetings.each do |meeting|
  json.meeting meeting
  json.user meeting.user
  unless meeting.invites.where(user: User.first).empty?
    json.accepted meeting.invites.where(user: User.first).first.accepted
  end
end