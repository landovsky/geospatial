class SensorSerializer < ActiveModel::Serializer
  attributes :id, :floor_id, :building_id, :coordinates,
             :device_type, :major, :minor, :tx_power, :cc1310_id,
             :sn, :rssi, :coordinates_wgs, :beacon_type, :type,
             :stone_name, :height,
             :deleted_at, :created_at, :updated_at

  def coordinates
    object&.position&.coordinates
  end
end
