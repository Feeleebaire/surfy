class Slot < ApplicationRecord
  belongs_to :camp
  has_many :camp_bookings
end
