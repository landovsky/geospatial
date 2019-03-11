class EnablePostgis < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'postgis'
    # enable_extension 'postgis_topology'
    # enable_extension 'postgis_sfcgal'
    # enable_extension 'fuzzystrmatch'
    # enable_extension 'address_standardizer'
    # enable_extension 'address_standardizer_data_us'
    # enable_extension 'postgis_tiger_geocoder'
  end
end
