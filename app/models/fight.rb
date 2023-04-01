class Fight < ApplicationRecord
  belongs_to :event
  belongs_to :fighter1, class_name: "Fighter"
  belongs_to :fighter2, class_name: "Fighter"
  has_many :fight_participants, dependent: :destroy

  validates :event, presence: true
  validates :fighter1, presence: true
  validates :fighter2, presence: true
end
