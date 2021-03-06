class CampReview < ApplicationRecord
  #associations
  belongs_to :camp
  belongs_to :user
  #validations
  validates :rate, presence: true
  validates :title, presence: true
  validates :comment, presence: true
end
