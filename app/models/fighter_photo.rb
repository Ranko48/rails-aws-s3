class FighterPhoto < ApplicationRecord
  belongs_to :fighter
  belongs_to :user

  validates :fighter, presence: true
  validates :user, presence: true

  mount_uploader :photo, FighterPhotosUploader
end
