class Building < ApplicationRecord
  before_create { self.building_uuid ||= SecureRandom.uuid }
end
