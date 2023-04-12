class Fighter < ApplicationRecord
  has_many :fight_participants, dependent: :destroy
  has_many :fights_as_fighter1, class_name: "Fight", foreign_key: "fighter1_id", dependent: :nullify
  has_many :fights_as_fighter2, class_name: "Fight", foreign_key: "fighter2_id", dependent: :nullify

  has_many :fighter_photos, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :professional_record, presence: true, format: { with: /\A\d+-\d+-\d+\z/, message: "should be in format wins-losses-draws (e.g. 10-2-1)" }
  validates :city_of_origin, presence: true, length: { maximum: 100 }
  validates :club, presence: true, length: { maximum: 100 }

  def fights
    Fight.where("fighter1_id = ? OR fighter2_id = ?", id, id)
  end

  def events
    fights.map(&:event).uniq
  end

  def opponents
    fights.map { |fight| fight.fighter1 == self ? fight.fighter2 : fight.fighter1 }
  end

  def event_titles
    events.map(&:title)
  end
end
