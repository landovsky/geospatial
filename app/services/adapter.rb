module Adapter
  module RGeo
    def self.encode(coordinates)
      factory = ::RGeo::Cartesian.simple_factory(srid: Geometry::DEFAULT_SRID)
      factory.point(*coordinates)
    end
  end
end
