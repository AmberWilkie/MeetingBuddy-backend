class Meeting < ApplicationRecord
  belongs_to :user
  has_many :agenda_points
  has_many :invites
end
