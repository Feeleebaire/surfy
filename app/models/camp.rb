class Camp < ApplicationRecord
  belongs_to :organisation
  has_many :slots
end
