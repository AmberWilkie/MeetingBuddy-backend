json.meetings @meetings.each do |meeting|
  json.meeting meeting
  json.user meeting.user
  json.accepted meeting.invites.where(user: User.first).first.accepted
end