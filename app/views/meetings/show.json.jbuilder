  json.meeting @meeting
  json.user @meeting.user
  json.agenda_points @meeting.agenda_points.each do |ap|
    json.item ap
  end