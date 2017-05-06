json.meetings @meetings.each do |meeting|
  json.id meeting.id
  json.title meeting.title
  json.summary meeting.summary
  json.location meeting.location
  json.length meeting.length
  json.time meeting.time
  json.created_at meeting.created_at
  json.user do
    json.id meeting.user.id
    json.name meeting.user.first_name + ' ' + meeting.user.last_name
    json.email meeting.user.email
    json.phone meeting.user.phone
    json.role meeting.user.role
  end

end