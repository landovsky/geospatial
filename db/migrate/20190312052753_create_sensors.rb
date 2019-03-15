class CreateSensors < ActiveRecord::Migration[5.2]
  def change
    create_table :sensors do |t|
      t.references :floor, foreign_key: true
      t.references :building, foreign_key: true

      t.float :coordinates, array: true
      t.integer :device_type
      t.integer :major
      t.integer :minor
      t.integer :tx_power
      t.bigint :cc1310_id
      t.string :sn
      t.float :rssi
      t.float :coordinates_wgs, array: true
      t.integer :beacon_type, default: 1
      t.string :type, null: false
      t.string :stone_name
      t.geometry :position, srid: 4326
      t.float :height, default: 0

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
