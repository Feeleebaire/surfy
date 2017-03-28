class Organisation < ApplicationRecord
  has_many :camps
  belongs_to :user
end
