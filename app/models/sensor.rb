class Sensor < ApplicationRecord
  before_create :encode_position

  belongs_to :building
  belongs_to :floor

  validates :type, presence: true

  private

  def encode_position
    self.position = ::Geometry::Point.new(coordinates).encode
  end
end
