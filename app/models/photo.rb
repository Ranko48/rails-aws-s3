class Photo < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :article, presence: true
  validates :user, presence: true

  mount_uploader :photo, PhotoUploader

  scope :persisted, -> { where "id IS NOT NULL" }
end

