class CreateFloors < ActiveRecord::Migration[5.2]
  def change
    create_table :floors do |t|
      t.references :building, foreign_key: true

      t.integer :position
      t.string :title
      t.float :floor_polygon, array: true
      t.json :transformation
      t.string :deployment_photo
      t.json :wgs_transformation
      t.float :ppm, array: true
      t.boolean :published, default: false
      t.datetime :deleted_at
      t.integer :floor, null: false
      t.float :height, default: 1, null: false
      t.float :deployment_photo_width
      t.float :deployment_photo_height
      t.geometry :multipolygon, srid: 4326
      t.timestamps
    end
  end
end
