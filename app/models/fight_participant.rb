class FightParticipant < ApplicationRecord
  belongs_to :fight
  belongs_to :fighter
end
