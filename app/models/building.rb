class Building < ApplicationRecord
  before_create { self.building_uuid ||= SecureRandom.uuid }

  has_many :floors, dependent: :destroy
end
