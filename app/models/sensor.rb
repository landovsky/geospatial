class Sensor < ApplicationRecord
  belongs_to :building
  belongs_to :floor

  validates :type, presence: true
end
