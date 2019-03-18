class Floor < ApplicationRecord
  belongs_to :building

  has_many :sensors, dependent: :destroy
end
