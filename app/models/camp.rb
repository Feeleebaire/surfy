class Camp < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  #associations
  belongs_to :organisation
  has_many :slots
  has_many :camp_bookings
  has_many :camp_reviews
  #validations
  validates :address, presence: true


  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
