class Sensor < ApplicationRecord
  before_create :set_postgis_point

  belongs_to :building
  belongs_to :floor

  validates :type, presence: true

  private

  def set_postgis_point
    self.position = ::Geometry::Point.new(coordinates).wgs
  end
end
