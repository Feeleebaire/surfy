class Organisation < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :camps
  belongs_to :user
end
