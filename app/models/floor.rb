class Floor < ApplicationRecord
  belongs_to :building

  has_many :floors
  has_many :sensors
end
