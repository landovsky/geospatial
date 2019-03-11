class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :building_uuid
      t.string :name
      t.integer :account_id
      t.datetime :created_at
      t.datetime :updated_at
      t.string :time_zone
      t.text :description
      t.string :building_photo_big
      t.string :building_photo_small
      t.integer :visibility, null: false, default: 0
      t.string :working_hours
      t.string :street
      t.string :phone
      t.string :label
      t.text :building_polygon
      t.datetime :deleted_at
      t.integer :order, default: 0
      t.boolean :published, default: false
      t.geometry :multipolygon, srid: 4326
      t.timestamps
    end
  end
end
