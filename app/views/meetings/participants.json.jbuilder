json.participants @participants.each do |participant|
  json.participant participant
  json.accepted @meeting.invites.find_by(user: participant).accepted
end