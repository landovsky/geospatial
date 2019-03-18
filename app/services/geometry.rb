class Geometry
  DEFAULT_SRID = 4326

  class Point
    attr_reader :adapter, :coordinates

    def initialize(coordinates, adapter: Adapter::Postgis)
      @coordinates = validated_coordinates(coordinates)
      @adapter     = adapter
    end

    def encode
      adapter.encode coordinates
    end

    private

    def validated_coordinates(coords)
      return coords if coords.is_a?(Array) &&
                       coords.size == 2 &&
                       coords.all? { |c| c.respond_to? :integer? }
      raise ArgumentError, "Coordindates must be an Array of 2 integers, #{coords} were provided."
    end
  end
end
