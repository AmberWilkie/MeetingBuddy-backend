json.meetings @meetings.each do |meeting|
  json.meeting meeting
  json.user meeting.user
end