class CampBooking < ApplicationRecord
  belongs_to :slot
  belongs_to :camp
  belongs_to :user
end
