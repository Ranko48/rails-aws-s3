class Event < ApplicationRecord
  has_many :fights, dependent: :destroy
  accepts_nested_attributes_for :fights, allow_destroy: true
  has_many :fighters, through: :fights

  has_many :event_photos

  validates :title, presence: true
  validates :date, presence: true

  def all_fighters
    fights.flat_map { |fight| [fight.fighter1, fight.fighter2] }.uniq
  end
end
