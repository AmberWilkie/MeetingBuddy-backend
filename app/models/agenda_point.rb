class AgendaPoint < ApplicationRecord
  belongs_to :user
  belongs_to :meeting
  has_many :votes, :as => :votable
end
