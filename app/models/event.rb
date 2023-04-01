class Event < ApplicationRecord
  has_many :fights, dependent: :destroy
  accepts_nested_attributes_for :fights, allow_destroy: true
  has_many :fighters, through: :fights

  validates :title, presence: true
  validates :date, presence: true
end
